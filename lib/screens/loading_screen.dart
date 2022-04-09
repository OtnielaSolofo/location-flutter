import 'dart:convert';
import 'package:flutter_sample3/services/location.dart';
import 'package:flutter_sample3/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:flutter_sample3/utilities/constants.dart';
import 'location_screen.dart';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

    } else {
      print('error');
    }
  }

  void getLocationTest() async {

  }

  void getCurrentLocation() async {
    Position position = await determinePosition();

    Networking networking = Networking(url: '${url_web}lat=${position.latitude}&lon=${position.longitude}&appid=$api_key');

    var dataWeather = await networking.getData();

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LocationScreen(weatherData: dataWeather,)));

    //double temperature = jsonResponse['main']['temp'];
    //int condition = jsonResponse['weather'][0]['id'];
    //String cityName = jsonResponse['name'];

  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    // TODO: implement initState
    // getLocation();
    getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SpinKitDoubleBounce(
          color: Colors.blueGrey,
          size: 50.0,
        ),
      ),
    );
  }
}
