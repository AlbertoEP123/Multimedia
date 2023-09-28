
void main(List<String> args) {
  final prueba = Coche("toyota", "auris", 2);
  print(prueba);
}

class Coche {
  String marca = "";
  String modelo = "";
  int id = 0;

  Coche(String marca, String modelo, int id) {
    this.marca = marca;
    this.modelo = modelo;
    this.id = id;
  }

  String get Marca {
    return marca;
  }

  set Marca(String laMarca) {
    marca = laMarca;
  }

  String get Modelo {
    return modelo;
  }

  set Modelo(String elModelo) {
    modelo = elModelo;
  }
   int get Id {
    return id;
  }

  set Id(int elId) {
    id= elId;
  }

  @override
  String toString() {
    return 'Marca: ${marca}, Modelo: ${modelo}, ID: ${id}';
  }
}