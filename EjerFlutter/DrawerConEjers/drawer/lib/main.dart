import 'package:drawer/ejercicios/ejer9/lib/ejer9.dart';
import 'package:flutter/material.dart';

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
        title: const Text('9 10 11 12'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Lista de ejercicios',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: const Text(
                  'Lista ejercicios (A partir del 9), Anteriores sin drawer'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Ejercicio 9'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyGridView()));
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: const Text('Ejercicio 10'),
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
      body: const Center(
        child: Text(
          'Ejercicios Alberto',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
