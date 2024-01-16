import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
   @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Drawer Personalizado',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            title: const Text('Opción 1'),
            onTap: () {
              // Lógica para la opción 1
              Navigator.pop(context); // Cierra el Drawer
            },
          ),
          ListTile(
            title: const Text('Opción 2'),
            onTap: () {
              // Lógica para la opción 2
              Navigator.pop(context); // Cierra el Drawer
            },
          ),
          // Puedes agregar más opciones según sea necesario
        ],
      ),
    );
  }
}