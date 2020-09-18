import 'package:flutter/material.dart';
import 'package:weather_app/WeatherPage.dart';

void main() {
  runApp(MaterialApp(
    title: "Weather App",
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  final List<String> cities = <String>[
    'Mumbai',
    'Pune',
    'Delhi',
    'Nashik',
    'Nagpur'
  ];
  String city;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose a City"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: cities.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Container(
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return WeatherPage(city: '${cities[index]}');
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    '${cities[index]}',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                color: Colors.lightBlue,
              ),
            ),
          );
        },
      ),
    );
  }
}
