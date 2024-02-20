import 'package:flutter/material.dart';
import 'package:lib/ejercicios/ejer9.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PSP',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer ejercicios 9,10,11,12 flutter'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Lista ejercicios (A partir del 9), Anteriores sin drawer'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Ejercicio 9'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => Ejer9Screen())); // Usa Ejer9Screen sin comillas
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Ejercicio 10'),
              onTap: () {
                Navigator.pop(context);
                // Aquí puedes implementar la navegación al ejercicio 10
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Ejercicio 11'),
              onTap: () {
                Navigator.pop(context);
                // Aquí puedes implementar la navegación al ejercicio 11
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Ejercicio 12'),
              onTap: () {
                Navigator.pop(context);
                // Aquí puedes implementar la navegación al ejercicio 12
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Ejercicios Alberto',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
