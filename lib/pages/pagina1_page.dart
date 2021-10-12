import 'package:flutter/material.dart';
import 'package:manejo_estados/models/usuario.dart';
import 'package:manejo_estados/services/usuario_service.dart';
import 'package:provider/provider.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Página 1'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                usuarioService.eliminarUsuario();
              },
              icon: Icon(Icons.delete))
        ],
      ),
      body: usuarioService.existeUsuario
          ? HojaDeVidaUsuario(usuarioService.usuario)
          : Center(
              child: Text('No datos de usuario'),
            ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.navigate_next),
          onPressed: () => Navigator.pushNamed(context, 'pag2')),
    );
  }
}

class HojaDeVidaUsuario extends StatelessWidget {
  final Usuario usuario;

  const HojaDeVidaUsuario(this.usuario);

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
            Text(
              'Datos Personales',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Divider(),
            ListTile(
              title: Text('Nombre:'),
              subtitle: Text(usuario.nombre),
            ),
            ListTile(
              title: Text('Edad:'),
              subtitle: Text('${usuario.edad}'),
            ),

            // Profesiones
            Text(
              'Profresiones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Divider(),

            
            ...usuario.profesiones!
                .map((e) => ListTile(title: Text(e)))
                .toList()

            /*
            ListTile(
              title: Text('Profesión #1:'),
              subtitle: Text('Desarrollador Android'),
            )
            */
          ],
        ),
      ),
    );
  }
}
