import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ejercicio 3'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 300,
                height: 300,
                color: Colors.amber,
                child: Image.asset('resources/monalisa.png'),
              ),
              Container(
                width: 300,
                height: 300,
                color: Colors.green,
                child: Image.asset('resources/elgrito.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
