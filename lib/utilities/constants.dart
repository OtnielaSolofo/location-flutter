import 'package:flutter/material.dart';

const String api_key = "6214385c5e8a0a44dd4750a2cd16b351";
const String url =
    "http://api.openweathermap.org/data/2.5/forecast?id=524901&appid=6214385c5e8a0a44dd4750a2cd16b351";
const String url_web = "https://api.openweathermap.org/data/2.5/weather?";

const kInputDecoration = InputDecoration(
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: Colors.white, width: 0.0)),
    filled: true,
    fillColor: Colors.white,
    hintText: "City name",
    hintStyle: TextStyle(color: Colors.grey),
    border: OutlineInputBorder(
        borderRadius:
        BorderRadius.all(Radius.circular(15))));
