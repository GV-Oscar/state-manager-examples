import 'package:flutter/material.dart';
import 'package:manejo_estados/models/usuario.dart';

class UsuarioService with ChangeNotifier {
  Usuario? _usuario;

  Usuario get usuario => _usuario!;
  bool get existeUsuario => _usuario != null ? true : false;

  set usuario(Usuario usuario) {
    _usuario = usuario;
    notifyListeners();
  }

  void cambiarEdad(int edad) {
    if (existeUsuario) {
      _usuario!.edad = edad;
      notifyListeners();
    }
  }

  void eliminarUsuario() {
    _usuario = null;
    notifyListeners();
  }

  void agregarProfesion(){
    if (existeUsuario) {
      _usuario!.profesiones!.add('Profesión ${usuario.profesiones!.length +1}');
      notifyListeners();
    }
  }
}
