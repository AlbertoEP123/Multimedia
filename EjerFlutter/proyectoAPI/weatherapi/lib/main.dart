import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyWeatherApp());
}

class MyWeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  String _googleMapsLink = '';

  void initState() {
    super.initState();
    _cityController.addListener(_onCityChanged);
  }

  void _onCityChanged() {
    setState(() {
      _googleMapsLink = ''; // Restablecer el enlace cuando cambia la ciudad
    });
  }

  Future<void> _getWeatherData(String city) async {
    final String apiKey = '25ed3f5e8fa270f9f1f38b18e02e25b1';
    final String apiUrl =
        'http://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';

    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final datosPrincipales = jsonData['main'];
      final datosClima = jsonData['weather'][0];
      final coordenadas = jsonData['coord'];

      final nombreCiudad = jsonData['name'];
      final pais = jsonData['sys']['country'];
      final temperatura = datosPrincipales['temp'];
      final sensacionTermica = datosPrincipales['feels_like'];
      final tempMinima = datosPrincipales['temp_min'];
      final tempMaxima = datosPrincipales['temp_max'];
      final humedad = datosPrincipales['humidity'];
      final presion = datosPrincipales['pressure'];
      final descripcionClima = datosClima['description'];
      final indiceUV = jsonData['uvIndex'];
      final visibilidad = jsonData['visibility'];
      final amanecer = jsonData['sys']['sunrise'];
      final atardecer = jsonData['sys']['sunset'];
      final velocidadViento = jsonData['wind']['speed'];
      final direccionViento = jsonData['wind']['deg'];
      final latitude = coordenadas['lat'];
      final longitude = coordenadas['lon'];
      final googleMapsUrl =
          'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Ciudad Seleccionada'),
            content: Text('Has elegido la ciudad de $nombreCiudad, $pais'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cerrar'),
              ),
            ],
          );
        },
      );

      setState(() {
        _weatherData = 'Temperatura actual: $temperatura°C\n' +
            'Sensación térmica: $sensacionTermica°C\n' +
            'Temperatura Mínima: $tempMinima°C\n' +
            'Temperatura Máxima: $tempMaxima°C\n' +
            'Humedad relativa: $humedad%\n' +
            'Presión atmosférica: $presion hPa\n' +
            'Descripción del clima: $descripcionClima\n' +
            'Índice UV: $indiceUV\n' +
            'Visibilidad: $visibilidad\n' +
            'Hora del amanecer: ${_convertirUnixAFormatoHora(amanecer)}\n' +
            'Hora del atardecer: ${_convertirUnixAFormatoHora(atardecer)}\n' +
            'Velocidad del viento: $velocidadViento m/s\n' +
            'Dirección del viento: $direccionViento°\n' +
            'Coordenadas Geográficas: Latitud: $latitude, Longitud: $longitude';
        _googleMapsLink = googleMapsUrl;
      });
    } else {
      setState(() {
        _weatherData = 'Error al obtener datos del clima.';
      });
    }
  }

  String _convertirUnixAFormatoHora(int unixTime) {
    var fecha = DateTime.fromMillisecondsSinceEpoch(unixTime * 1000);
    return '${fecha.hour}:${fecha.minute}:${fecha.second}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WeatherApi Alberto'),
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
            SizedBox(height: 20),
            if (_googleMapsLink.isNotEmpty)
              ElevatedButton(
                onPressed: () {
                  launch(_googleMapsLink);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.map), // Agrega el icono antes del texto
                    Text('Ver en Google Maps'),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
