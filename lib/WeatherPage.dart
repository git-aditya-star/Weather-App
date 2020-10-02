import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherPage extends StatefulWidget {
  final String city;
  var api = '2b212d5bd57bf4d21819d3cb60304e80';

  WeatherPage({
    Key key,
    @required this.city,
  }) : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  var temp;
  var description;
  var current;
  var humidity;
  var windspeed;

  Future getWeather() async {
    http.Response response = await http.get(
        'http://api.openweathermap.org/data/2.5/weather?q=${widget.city}&units=metric&appid=2b212d5bd57bf4d21819d3cb60304e80');
    var results = jsonDecode(response.body);
    setState(() {
      this.temp = results['main']['temp'];
      this.description = results['weather'][0]['description'];
      this.current = results['weather'][0]['main'];
      this.humidity = results['main']['humidity'];
      this.windspeed = results['wind']['speed'];
    });
  }

  @override
  void initState() {
    super.initState();
    this.getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Weather"),
          backgroundColor: Color(0xFFccccff),
        ),
        body: Column(
          children: [
            Material(
              elevation: 20,
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Color(0xFFcc99ff), Color(0xFFff99ff)])),
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        widget.city,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      temp != null ? temp.toString() + '\u00B0' : "Loading",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10.0),
                      child: Text(
                        current != null ? current.toString() : "Loading",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ListView(
                  children: [
                    ListTile(
                      leading: FaIcon((FontAwesomeIcons.thermometerHalf)),
                      title: Text("Temperature"),
                      trailing: Text(temp != null
                          ? temp.toString() + '\u00B0'
                          : "Loading"),
                    ),
                    ListTile(
                      leading: FaIcon((FontAwesomeIcons.cloud)),
                      title: Text("Weather"),
                      trailing: Text(description != null
                          ? description.toString()
                          : "loading"),
                    ),
                    ListTile(
                      leading: FaIcon((FontAwesomeIcons.sun)),
                      title: Text("Humidity"),
                      trailing: Text(
                          humidity != null ? humidity.toString() : 'loading'),
                    ),
                    ListTile(
                      leading: FaIcon((FontAwesomeIcons.wind)),
                      title: Text("Wind Speed"),
                      trailing: Text(
                          windspeed != null ? windspeed.toString() : 'loading'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
