import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicio 6',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Zona de aterrizaje, ejer 6'),
        ),
        body: Align(
          alignment: Alignment
              .topCenter, // Alineación en la parte superior y al centro
          child: Container(
            margin: const EdgeInsets.only(top: 250.0), // Margen superior
            width: 400,
            height: 400,

            // Voy a hacer un decoration, que permite aplicarle forma al container
            decoration: BoxDecoration(
              shape: BoxShape.circle, // Que sea circular
              border: Border.all(color: Colors.orange),
            ),
            child: const Center(
              child: Text(
                'H',
                style: TextStyle(
                    fontSize: 150,
                    fontWeight: FontWeight.bold,
                   
              ),
            ),
          ),
        ),
      ),
    );
  }
}
