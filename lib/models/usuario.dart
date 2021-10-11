class Usuario {
  String nombre;
  int edad;
  List<String>? profesiones;

  Usuario({required this.nombre, required this.edad, required this.profesiones})
      : assert(nombre != null),
        assert(edad > 0);
}
