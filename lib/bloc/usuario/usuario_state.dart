part of 'usuario_cubit.dart';

/// Clase inmutable que representa un estado de usuario
@immutable
abstract class UsuarioState {}

/// Clase que define el estado inicial de un usuario
class UsuarioInitial extends UsuarioState {
  // En este estado el usuario no existe, en pocas palabras; no se ha cargado ningun dato de usuario.
  final _existeUsuario = false;

  @override
  String toString() {
    return 'UsuarioInitial: ${_existeUsuario ? 'Hay información de usuario' : 'No hay información de usuario'}';
  }
}

class UsuarioCargado extends UsuarioState {
  // En este estado el usuario existe, en pocas palabras; ya se cargaron datos de usuario.
  final existeUsuario = true;
  final Usuario usuario;

  UsuarioCargado(this.usuario);
}
