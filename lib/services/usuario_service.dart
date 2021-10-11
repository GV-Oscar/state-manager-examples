import 'dart:async';

import 'package:manejo_estados/models/usuario.dart';

/// Clase singleton sin fabrica
class _UsuarioService {
  Usuario? _usuario;

  final StreamController<Usuario> _usuarioStreamController =
      StreamController<Usuario>.broadcast();

  Stream<Usuario> get usuarioStream => _usuarioStreamController.stream;

  /// Obtener usuario
  Usuario? get usuario => _usuario;

  bool get existeUsuario => (_usuario != null) ? true : false;

  void cargarUsuario(Usuario usuario) {
    _usuario = usuario;
    _usuarioStreamController.add(usuario);
  }

  void cambiarEdad(int edad) {
    if (existeUsuario) {
      _usuario!.edad = edad;
      _usuarioStreamController.add(_usuario!);
    }
  }

  void dispose() {
    _usuarioStreamController.close();
  }
}

final usuarioService = _UsuarioService();
