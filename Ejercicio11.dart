void main(List<String> args) {
  
}

class Persona {
  late String nombre;
  late String apellidos;
  late String DNI;
  late String direccion;
  late int CP;
  late String ciudad;
  late DateTime fechaNacimiento;
  Persona(this.CP,this.nombre,this.apellidos,this.DNI,this.direccion,this.ciudad,this.fechaNacimiento);

  @override
  String toString() {
    
    return super.toString();
  }
}

class Alumno extends Persona {
  late int codigo;
  late String estudios;
  late int curso;
  late int edad;
}