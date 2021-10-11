import 'package:flutter/material.dart';
import 'package:manejo_estados/models/usuario.dart';
import 'package:manejo_estados/services/usuario_service.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: usuarioService.usuarioStream,
          builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
            //String title = usuarioService.existeUsuario ? usuarioService.usuario!.nombre : 'Página 2';
            return usuarioService.existeUsuario
                ? Text(usuarioService.usuario!.nombre)
                : Text('Página 2');
          },
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  final usuario = new Usuario(
                      nombre: 'Oscar Giraldo', edad: 28, profesiones: []);
                  usuarioService.cargarUsuario(usuario);
                },
                child: Text('Establecer Usuario')),
            ElevatedButton(
                onPressed: () {
                  usuarioService.cambiarEdad(38);
                },
                child: Text('Cambiar Edad')),
            ElevatedButton(onPressed: () {}, child: Text('Añadir Profesión')),
          ],
        ),
      ),
    );
  }
}
