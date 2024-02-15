import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyWeatherApp());
}

class MyWeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherHomePage(),
    );
  }
}

class WeatherHomePage extends StatefulWidget {
  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  final TextEditingController _cityController = TextEditingController();
  String _weatherData = '';

  Future<void> _getWeatherData(String city) async {
    final String apiKey = '25ed3f5e8fa270f9f1f38b18e02e25b1'; // <-- API de OpenWeatherMap 
    final String apiUrl =
        'http://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';

    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        _weatherData =
            'Temperatura: ${jsonData['main']['temp']}°C\nDescripción: ${jsonData['weather'][0]['description']}';
      });
    } else {
      setState(() {
        _weatherData = 'Error al obtener datos del clima.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _cityController,
              decoration: const InputDecoration(
                labelText: 'Ciudad',
                hintText: 'Ingrese una ciudad',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final String city = _cityController.text.trim();
                if (city.isNotEmpty) {
                  _getWeatherData(city);
                }
              },
              child: const Text('Obtener clima'),
            ),
            SizedBox(height: 20),
            Text(
              _weatherData,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
