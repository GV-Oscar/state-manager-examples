import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:manejo_estados/models/usuario.dart';
import 'package:meta/meta.dart';

part 'usuario_state.dart';
part 'usuario_event.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  UsuarioBloc() : super(UsuarioState()) {
    // Registrar controlador de evento: CargarUsuario
    on<CargarUsuario>(_onCargarUsuario);
    // Registrar controlador de evento: CambiarEdad
    on<CambiarEdad>(_onCambiarEdad);
    // Registrar controlador de evento: AgregarProfesion
    on<AgregarProfesion>(_onAgregarUsuario);
  }

  // Se dispara cuando se detecta el evento : Cargar Usuario
  FutureOr<void> _onCargarUsuario(
      CargarUsuario event, Emitter<UsuarioState> emit) {
    print('onCargarUsuario : ${event.usuario}');
    // Emitir nuevo estado de usuario para actualizar la UI.
    // emit(UsuarioState(newUsuario: event.usuario));
    emit(state.copyWith(usuario: event.usuario));
  }

  // Se dispara cuando se detecta el evento : CambiarEdad
  FutureOr<void> _onCambiarEdad(CambiarEdad event, Emitter<UsuarioState> emit) {
    // Comprobar en el estado actual, si el usuario existe
    if (state.existeUsuario) {
      // Aumentar edad de usuario
      final usuarioCopy =
          state.usuario!.copyWith(edad: state.usuario!.edad + 1);
      // Emitir nuevo estado de usuario para actualizar la UI.
      emit(state.copyWith(usuario: usuarioCopy));
    }
  }

  // Se dispara cuando se detecta el evento: Agregar Edad
  FutureOr<void> _onAgregarUsuario(
      AgregarProfesion event, Emitter<UsuarioState> emit) {
    print('_onAgregarUsuario');
    // Comprobar en el estado actual, si el usuario existe
    if (state.existeUsuario) {
      // Crear nuevo listado de profesiones y agregar una nueva
      final profesiones = [
        ...state.usuario!.profesiones,
        'Profesión #: ${state.usuario!.profesiones.length + 1}'
      ];
      // Asignar nuevo listado de profesiones a una copia del usuario actual
      final usuarioCopy = state.usuario!.copyWith(profesiones: profesiones);
      // Emitir nuevo estado de usuario para actualizar la UI.
      // emit(UsuarioState(newUsuario: usuarioCopy));
      emit(state.copyWith(usuario: usuarioCopy));
    } else {
      print('No hay datos de usuario');
    }
  }

  /// Se dispara cuando se detecta cualquier tipo de evento
  @override
  void onEvent(UsuarioEvent event) {
    super.onEvent(event);

    // Comprobar tipo de evento : BorrarUsuario
    if (event is BorrarUsuario) {
      // Emitir nuevo estado de usuario para actualizar la UI.
      emit(state.initialState());
    }
  }
}
