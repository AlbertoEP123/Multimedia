import 'package:flutter/material.dart';

class historiasdestacadas extends StatelessWidget {
  final String text;
  final String imagen;
  final double width;
  final double height;

  const historiasdestacadas({
    Key? key,
    required this.text,
    required this.imagen,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 100,  // Puedes ajustar este ancho según tus necesidades
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey.shade400,
                  width: 1,
                ),
              ),
              width: 75,
              height: 75,
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.pink.shade100,
                  border: Border.all(
                    color: Colors.grey.shade400,
                    width: 1,
                  ),
                ),
                width: 65,
                height: 65,
                alignment: Alignment.center,
                child: Image.asset(
                  imagen,
                  width: width,
                  height: height,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(text),
          ],
        ),
      ),
    );
  }
}
