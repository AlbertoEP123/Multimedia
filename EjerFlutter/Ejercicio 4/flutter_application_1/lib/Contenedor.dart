import 'package:flutter/material.dart';

class Contenedor extends StatelessWidget {
  final Color color;
  final double alto;
  final double ancho;
  final String texto;
  // Creo variable de padding, de tipo edge insets que esto crea
  // espacios y margenes para cualquier widget
  final EdgeInsets padding;
  // creo variable tipo aligment, para alinear los contenedores
  final Alignment alineacion;

  Contenedor({
    required this.color,
    required this.alto,
    required this.ancho,
    required this.texto,
    //lo añado al constructor
    required this.alineacion,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: ancho,
      height: alto,
      margin: padding, // Usa margin en lugar de padding para aplicar el espacio
      alignment: alineacion,
      child: Center(
        child: Text(texto),
      ),
    );
  }
}
