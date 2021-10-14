part of 'usuario_bloc.dart';

@immutable
abstract class UsuarioEvent {}

/// Evento para cargar usuario.
class CargarUsuario extends UsuarioEvent {
  final Usuario usuario;
  CargarUsuario(this.usuario);
}

/// Evento para cambiar la edad
class CambiarEdad extends UsuarioEvent {
  // final int edad;
  // CambiarEdad(this.edad);
  CambiarEdad();
}

class AgregarProfesion extends UsuarioEvent {
  AgregarProfesion();
}

class BorrarUsuario extends UsuarioEvent {
  BorrarUsuario();
}
