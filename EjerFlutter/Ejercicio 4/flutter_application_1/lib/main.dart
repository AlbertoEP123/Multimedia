import 'package:flutter/material.dart';
import 'Contenedor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejemplo de iconos',
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Ejercicio 4, padding y alineacion'),
          ),
        ),
        body: Row(
          children: <Widget>[
            Contenedor(
              color: Colors.cyan,
              alto: 120.0,
              ancho: 120.0,
              texto: 'azul',
              padding:
                  const EdgeInsets.all(58.0), // Agrega el padding que quiera
              alineacion: Alignment.center, // Agrega la alineación que quiera
            ),
            Contenedor(
              color: Colors.pink,
              alto: 100.0,
              ancho: 100.0,
              texto: 'rosa',
              padding: const EdgeInsets.all(96.0),
              alineacion: Alignment.topLeft,
            ),
            Contenedor(
              color: Colors.green,
              alto: 110.0,
              ancho: 110.0,
              texto: 'verde',
              padding: const EdgeInsets.all(22.0),
              alineacion: Alignment.centerRight,
            ),
          ],
        ),
      ),
    );
  }
}
