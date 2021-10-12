import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:manejo_estados/models/usuario.dart';

part 'usuario_state.dart';

/// Clase manejadora de estado
class UsuarioCubit extends Cubit<UsuarioState> {
  // Construir el cubit con el estado inicial
  UsuarioCubit() : super(UsuarioInitial());

  /// Establecer información de usuario.
  void establecerUsuario(Usuario usuario) {
    // Emitir un nuevo estado.
    emit(UsuarioCargado(usuario));
  }

  void cambiarEdad(int edad) {
    final currentState = state;
    if (currentState is UsuarioCargado) {
      final usuario =
          currentState.usuario.copyWith(edad: currentState.usuario.edad + 1);
      emit(UsuarioCargado(usuario));
    }
  }

  void agregarProfesion() {
    final currentState = state;
    if (currentState is UsuarioCargado) {
      final profesiones = [
        ...currentState.usuario.profesiones!,
        'Profesión ${currentState.usuario.profesiones!.length + 1}'
      ];

      final usuario = currentState.usuario.copyWith(profesiones: profesiones);
      emit(UsuarioCargado(usuario));

      /*
      // opcion 1
      final profesiones = (state as UsuarioCargado).usuario.profesiones;
      profesiones!.add(
          'Profesión #${(state as UsuarioCargado).usuario.profesiones!.length + 1}');
      final usuario =
          (state as UsuarioCargado).usuario.copyWith(profesiones: profesiones);
      emit(UsuarioCargado(usuario));
     */
    }
  }

  void borrarUsuario() {
    emit(UsuarioInitial());
  }
}
