import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample3/utilities/constants.dart';

class CitytScreen extends StatefulWidget {
  const CitytScreen({Key? key}) : super(key: key);

  @override
  State<CitytScreen> createState() => _CitytScreenState();
}

class _CitytScreenState extends State<CitytScreen> {
  String cityName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "images/city_weather.png",
                  ))),
          child: Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                      size: 60,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_city,
                          color: Colors.white,
                        ),
                        Expanded(
                          child: TextField(
                            decoration: kInputDecoration,
                            onChanged: (value) {
                              setState(() {
                                cityName = value;
                              });
                            },
                            autofocus: true,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context,cityName);
                          },
                          child: Text(
                            "Get Weather",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 45),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
