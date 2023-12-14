import 'package:flutter/material.dart';

void main() {
  runApp(MiApp());
}

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MuestrarioBotones(),
    );
  }
}

class MuestrarioBotones extends StatefulWidget {
  @override
  _MuestrarioBotonesEstado createState() => _MuestrarioBotonesEstado();
}

class _MuestrarioBotonesEstado extends State<MuestrarioBotones> {
  bool _drawerVisible = true;
  bool _mostrarBotones = false;
  double _tamanioBoton = 10.0;

  void _manejarOpcionSeleccionada(int opcion) {
    setState(() {
      if (opcion == 1) {
        _mostrarBotones = true;
      } else {
        _mostrarBotones = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Presiona un ejercicio en el drawer'),
      ),
      body: _mostrarBotones
          ? GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              ),
              itemCount: botones.length,
              itemBuilder: (context, index) {
                Color colorFondo;
                if (index % 2 == 0) {
                  colorFondo =
                      Colors.blue; // Para los botones de la fila izquierda
                } else {
                  colorFondo =
                      Colors.green; // Para los botones de la fila derecha
                }
                return ElevatedButton(
                  onPressed: () {
                    // Acción a realizar al presionar el botón
                    print('Botón presionado: ${botones[index].label}');
                  },
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    primary: colorFondo,
                    padding: EdgeInsets.all(8.0),
                    minimumSize:
                        Size(_tamanioBoton, _tamanioBoton), // Ajuste necesario
                  ),
                  child: Text(
                    botones[index].label,
                    style: TextStyle(fontSize: 12),
                  ),
                );
              },
            )
          : Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // si no está visible, modifico el estado
            _drawerVisible = !_drawerVisible;
          });
        },
        child: Icon(Icons.menu),
      ),
      drawer: _drawerVisible
          ? CustomDrawer(onOpcionSeleccionada: _manejarOpcionSeleccionada)
          : null,
    );
  }
}

class CustomDrawer extends StatelessWidget {
  final Function(int) onOpcionSeleccionada;

  const CustomDrawer({required this.onOpcionSeleccionada});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Drawer Personalizado',
              style: TextStyle(
                color: Colors.white,
                fontSize: 34,
              ),
            ),
          ),
          ListTile(
            title: const Text('Ejercicio 9'),
            onTap: () {
              onOpcionSeleccionada(1);
              Navigator.pop(context); // Cierra el drawer
            },
          ),
          ListTile(
            title: const Text('Ejercicio 10'),
            onTap: () {
              onOpcionSeleccionada(2);
              Navigator.pop(context); // Cierra el drawer
            },
          ),
        ],
      ),
    );
  }
}

class BotonInfo {
  final String label;

  BotonInfo(this.label);
}

final List<BotonInfo> botones = [
  BotonInfo('Boton azul columna 1 fila 1'),
  BotonInfo('Boton verde columna 2 fila 1'),
  BotonInfo('Boton azul columna 1 fila 2'),
  BotonInfo('Boton verde columna 2 fila 2'),
  BotonInfo('Boton azul columna 1 fila 3'),
  BotonInfo('Boton verde columna 2 fila 3'),
];
