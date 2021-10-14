import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manejo_estados/controllers/usuario_controller.dart';
import 'package:manejo_estados/models/usuario.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments;
    print(arguments);

    final usuarioCtrl = Get.find<UsuarioController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Página 2'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  final usuario = Usuario(
                      nombre: 'Oscar Giraldo',
                      edad: 28,
                      profesiones: ['Android Dev', 'Flutter Dev']);
                  usuarioCtrl.cargarUsuario(usuario);
                  Get.snackbar('Usuario cargado',
                      'Nombre: ${usuario.nombre} , Edad: ${usuario.edad}',
                      //backgroundColor: Colors.white,
                      // boxShadows: [BoxShadow(color: Colors.black, blurRadius: 5)]
                  );
                },
                child: Text('Establecer Usuario')),
            ElevatedButton(
                onPressed: () {
                  usuarioCtrl.cambiarEdad(30);
                },
                child: Text('Cambiar Edad')),
            ElevatedButton(
                onPressed: () {
                  usuarioCtrl.agregarProfesion(
                      'Profesion #${usuarioCtrl.profesionesCount + 1}');
                },
                child: Text('Añadir Profesión')),
            ElevatedButton(
                onPressed: () {
                  Get.changeTheme(Get.isDarkMode
                      ? ThemeData.light()
                      : ThemeData.dark().copyWith());
                },
                child: Text('Cambiar Tema')),
          ],
        ),
      ),
    );
  }
}
