import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:manejo_estados/controllers/usuario_controller.dart';
import 'package:manejo_estados/models/usuario.dart';
import 'package:manejo_estados/pages/pagina2_page.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioCtrl = Get.put(UsuarioController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Página 1'),
        centerTitle: true,
      ),
      body: Obx(() => usuarioCtrl.existeUsuario.value
          ? HojaDeVidaUsuario(
              usuario: usuarioCtrl.usuario.value,
            )
          : NoInfoUsuario()),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.navigate_next),
          onPressed: () {
            // Navegacion de rutas de forma tradicional:
            // Navigator.pushNamed(context, 'pag2')

            // Navegacion de ruta con GetX
            Get.to(() => Pagina2Page(),
                arguments: {'nombre': 'Oscar', 'edad': 36});
          }),
    );
  }
}

class NoInfoUsuario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('No hay información de usuario'),
    );
  }
}

class HojaDeVidaUsuario extends StatelessWidget {
  final Usuario usuario;

  HojaDeVidaUsuario({required this.usuario});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Datos personales
            const Text(
              'Datos Personales',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            ListTile(
              title: const Text('Nombre:'),
              subtitle: Text('${usuario.nombre}'),
            ),
            ListTile(
              title: const Text('Edad:'),
              subtitle: Text('${usuario.edad}'),
            ),

            // Profesiones
            const Text(
              'Profresiones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),

            ...usuario.profesiones.map((profesion) => ListTile(
                  title: Text(profesion),
                ))
          ],
        ),
      ),
    );
  }
}
