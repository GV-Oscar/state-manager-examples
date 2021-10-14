part of 'usuario_bloc.dart';

class UsuarioState {
  final bool existeUsuario;
  final Usuario? usuario;

  UsuarioState({Usuario? newUsuario})
      : usuario = newUsuario,
        existeUsuario = (newUsuario != null) ? true : false;

  /// Copiar estado actual.
  UsuarioState copyWith({Usuario? usuario}) =>
      UsuarioState(newUsuario: usuario ?? this.usuario);

  /// Estado inicial
  UsuarioState initialState() => UsuarioState();
}
