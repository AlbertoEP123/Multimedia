import 'package:flutter/material.dart';
import 'barranavegacion.dart';
import 'pantallafinalizacion.dart';
import 'perfil.dart';

// Creamos pantalla inicio
class PantallaInicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // Alineamos el contenido
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Instagram',
            style: TextStyle(fontFamily: 'Lobster', fontSize: 45),
          ),
          SizedBox(height: 20), // Espaciado entre el texto e imagen
          Image.asset(
            'assets/fotooriginal.png', // No carga el avatar
            width: 2000,
            height: 550,
          ),
        ],
      ),
      // Implementamos la barra de navegacion
      bottomNavigationBar: BarraNavegacion(
        currentIndex: 0,
        onTap: (index) {
          handleNavigation(context, index);
        },
      ),
    );
  }

// Metodo usado en todas las paginas para manejar la navegacion
// entre diferentes pantallas según el indice proporcionado
// context: accede al contexto de flutter, index: pantalla a la que navega
// navigator.plush y material pageroute hace las transiciones
  void handleNavigation(BuildContext context, int index) {
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Perfil()),
        
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PantallaFinalizacion()),
      );
    }
  }
}
