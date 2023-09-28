/*
Realiza una clase llamada coche y crea una instancia 
de esa clase, asígnale dos propiedades y dos métodos. 
Asigna valores y comprueba que los valores se asignan
correctamente.
*/
import 'dart:io';

void main(List<String> args) {
  final coche = Coche();
  coche.id = 1;
  coche.Marca("Toyota");
  coche.Modelo("Yaris Cross");

  final cocheUsuario = Coche();
  print("Dime el id del coche ");
  cocheUsuario.id = int.parse(stdin.readLineSync().toString());
  print("Dime la marca del coche ");
  cocheUsuario.marca = stdin.readLineSync().toString();
  print("Dime el modelo del coche ");
  cocheUsuario.modelo = stdin.readLineSync().toString();

  coche.imprimir();
  cocheUsuario.imprimir();
}

class Coche {
  int id = 0;
  String marca = "";
  String modelo = "";

  void Marca(String marca) {
    this.marca = marca;
  }

  void Modelo(String modelo) {
    this.modelo = modelo;
  }

  void imprimir() {
    print("ID: $id");
    print("Marca: $marca");
    print("Modelo: $modelo");
  }
}
