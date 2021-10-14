import 'package:get/get.dart';
import 'package:manejo_estados/models/usuario.dart';

class UsuarioController extends GetxController {
  // Establecer variables observables
  var existeUsuario = false.obs;
  var usuario = Usuario().obs;

  /// Obtener cantidad de profesiones del usuario
  get profesionesCount => this.usuario.value.profesiones.length;

  /// Cargar información de usuario.
  void cargarUsuario(Usuario usuario) {
    // Añadir a los observables informaciópn
    existeUsuario.value = true;
    this.usuario.value = usuario;
  }

  void cambiarEdad(int edad) {
    this.usuario.update((val) {
      val!.edad = edad;
    });
  }

  void agregarProfesion(String profesion) {
    this.usuario.update((val) {
      val!.profesiones = [...val.profesiones, profesion];
    });
  }
}
