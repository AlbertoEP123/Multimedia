import 'package:flutter/material.dart';
import 'package:flutter_application_1/paginas/perfilbody.dart';
import 'barranavegacion.dart';
import 'pantallaInicio.dart';
import 'pantallafinalizacion.dart';

class Perfil extends StatelessWidget {
  final String nombre;
  final int publicaciones;
  final int seguidores;
  final int seguidos;

  const Perfil({
    this.nombre = 'Yúbal F.M.',
    this.publicaciones = 996,
    this.seguidores = 445,
    this.seguidos = 242,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 24, left: 16, right: 16),
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nombre,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/4.png'),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '$publicaciones\nPublicaciones',
                                style: const TextStyle(fontSize: 14),
                              ),
                              const SizedBox(width: 1),
                              Text(
                                '$seguidores\nSeguidores',
                                style: const TextStyle(fontSize: 14),
                              ),
                              const SizedBox(width: 1),
                              Text(
                                '$seguidos\nSeguidos',
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(3),
                                child: Container(
                                  constraints: BoxConstraints(maxWidth: 240.0),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 3),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color.fromARGB(255, 148, 148, 148),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Text(
                                    'Editar perfil',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: PerfilBody(),
          ),
        ],
      ),
      bottomNavigationBar: BarraNavegacion(
        currentIndex: 1,
        onTap: (index) {
          handleNavigation(context, index);
        },
      ),
    );
  }

  void handleNavigation(BuildContext context, int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PantallaInicio()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PantallaFinalizacion()),
      );
    }
  }
}
