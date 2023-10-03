void main(List<String> args) {
  DateTime fechaNac = DateTime(2002,2,2);
  Alumno manolo = Alumno("Manolo", "Gutierrez", "2683452M", "CALLE pepe", 29001, "grana", fechaNac, 2, "granjero" as int,2,21 as String);
  
}

class Persona {
  late String nombre;
  late String apellidos;
  late String DNI;
  late String direccion;
  late int cp;
  late String ciudad;
  late DateTime fechaNacimiento;
  Persona(this.nombre,this.apellidos,this.DNI,this.direccion,this.cp,this.ciudad,this.fechaNacimiento);

  int calcularEdad(){
    DateTime fechaActual = DateTime.now();
    int edad = fechaActual.year - fechaNacimiento.year;
    return edad;
  }
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

  Alumno(String nombre,
  String apellidos,
  String DNI,
  String direccion,
  int CP,
  String ciudad,
  DateTime fechaNacimiento, this.codigo,this.curso,this.edad,this.estudios) :super(nombre,apellidos,DNI,direccion,CP,ciudad,fechaNacimiento);
}
