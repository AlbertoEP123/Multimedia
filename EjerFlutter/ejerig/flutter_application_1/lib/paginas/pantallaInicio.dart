import 'package:flutter/material.dart';
import 'barranavegacion.dart';
import 'pantallafinalizacion.dart';
import 'perfil.dart';

// Creamos pantalla inicio
class PantallaInicio extends StatelessWidget {
  int _currentIndex = 0;
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
            width: 1500,
            height: 550,
          ),
        ],
      ),
      // Implementamos la barra de navegacion
      bottomNavigationBar: Container(
        
        height: 70,  
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            handleNavigation(context, index);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Perfil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.check),
              label: 'Finalización',
            ),
          ],
        ),
      ),
    );
  }

  // Metodo usado en todas las paginas para manejar la navegacion
  // entre diferentes pantallas según el indice proporcionado
  // context: accede al contexto de flutter, index: pantalla a la que navega
  // navigator.plush y material pageroute hace las transiciones
  void handleNavigation(BuildContext context, int index) {
    if (index == 0) {
      // Puedes agregar lógica adicional si es necesario para la página de inicio
    } else if (index == 1) {
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
