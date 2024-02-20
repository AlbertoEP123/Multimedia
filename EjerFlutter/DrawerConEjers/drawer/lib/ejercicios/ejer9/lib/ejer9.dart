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

class MyGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(10, (index) {
          return Container(
            color: index.isEven ? Colors.grey[100] : Colors.grey[400],
            margin: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Elemento $index',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          );
        }),
      ),
    );
  }
}
