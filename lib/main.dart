import 'package:flutter/material.dart';

import 'package:weather_app/home.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Weather App",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Home(),
    ),
  );
}
