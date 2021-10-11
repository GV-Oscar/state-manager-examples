import 'package:flutter/material.dart';
import 'package:manejo_estados/models/usuario.dart';
import 'package:manejo_estados/services/usuario_service.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página 1'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: usuarioService.usuarioStream,
        builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
          return snapshot.hasData
              ? HojaDeVidaUsuario(
                  usuario: snapshot.data!,
                )
              : const Center(
                  child: Text('No hay información de usuario'),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.navigate_next),
          onPressed: () => Navigator.pushNamed(context, 'pag2')),
    );
  }
}

class HojaDeVidaUsuario extends StatelessWidget {
  final Usuario usuario;
  const HojaDeVidaUsuario({required this.usuario});

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
              title: Text('Nombre:'),
              subtitle: Text(usuario.nombre),
            ),
            ListTile(
              title: Text('Edad:'),
              subtitle: Text('${usuario.edad} años'),
            ),

            // Profesiones
            const Text(
              'Profresiones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),

            ListTile(
              title: Text('Profesión #1:'),
              subtitle: Text('Desarrollador Android'),
            ),
            ListTile(
              title: Text('Profesión #2:'),
              subtitle: Text('Desarrollador IOS'),
            ),
            ListTile(
              title: Text('Profesión #3:'),
              subtitle: Text('Desarrollador Flutter'),
            ),
          ],
        ),
      ),
    );
  }
}
