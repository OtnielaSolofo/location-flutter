import 'package:flutter/material.dart';
import 'city_screen.dart';
import 'package:flutter_sample3/services/weather.dart';


class LocationScreen extends StatefulWidget {

  final weatherData;

  LocationScreen({this.weatherData});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  String message = "";

  void updateUI(){
    Weather weather = Weather();
    message = weather.getWeatherMessage(widget.weatherData['main']['temp']);
  }


  @override
  void initState() {
    updateUI();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/main_image.png"), fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 30, left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){

        },
                      child: Icon(
                        Icons.my_location_sharp,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () async{
                        var typedName = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CitytScreen()));

                        if(typedName != null){
                          print(typedName);
                        }
                      },
                      child: Icon(
                        Icons.location_city,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.only(left: 12),
                      child: Text(
                        "12° \n Bring a clothes just in case in $message",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 60,
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}


