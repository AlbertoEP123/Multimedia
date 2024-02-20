import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejer 9 gridView con botones',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyGridView(),
    );
  }
}
void index(index){
  
}
class MyGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView con Botones'),
      ),
      body: GridView.count(
        crossAxisCount: 2, // Columnas
        children: List.generate(2, (index) {
          //Genero la lista de filas automáticamente
          return Container(
            color: index.isEven
                ? Colors.grey[100]
                : Colors.grey[400], // Colores columnas
            margin: EdgeInsets.all(5.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50, // Ancho del botón
                    height: 50, // Alto del botón
                    child: IconButtonExample(), // Agregar el IconButtonExamplE
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class IconButtonExample extends StatelessWidget {
  const IconButtonExample({Key? key}) : super(key: key);
  
  get index => null;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: Ink(
          decoration: const ShapeDecoration(
            color: Colors.lightBlue,
            shape: CircleBorder(),
          ),
          child: IconButton(
            icon: const Icon(Icons.android),
            color: Colors.white,
            onPressed: () {
              // Mostrar AlertDialog
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Alerta'),
                    content: Text('Boton $index presionado'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Close'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
