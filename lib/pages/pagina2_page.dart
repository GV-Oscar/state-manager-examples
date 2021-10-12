import 'package:flutter/material.dart';
import 'package:manejo_estados/models/usuario.dart';
import 'package:manejo_estados/services/usuario_service.dart';
import 'package:provider/provider.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);

    return Scaffold(
      appBar: AppBar(
        title: usuarioService.existeUsuario
            ? Text(
                '${usuarioService.usuario.nombre} - ${usuarioService.usuario.edad} años')
            : Text('Página 2'),
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
                      profesiones: ['Android Developer', 'IOS Developer']);
                  usuarioService.usuario = usuario;
                },
                child: Text('Establecer Usuario')),
            ElevatedButton(
                onPressed: () {
                  if (usuarioService.existeUsuario) {
                    usuarioService.cambiarEdad(usuarioService.usuario.edad + 1);
                  }
                },
                child: Text('Cambiar Edad')),
            ElevatedButton(
                onPressed: () {
                  if (usuarioService.existeUsuario) {
                    usuarioService.agregarProfesion();
                  }
                },
                child: Text('Añadir Profesión')),
          ],
        ),
      ),
    );
  }
}
