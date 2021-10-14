import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manejo_estados/bloc/usuario/usuario_bloc.dart';
import 'package:manejo_estados/models/usuario.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página 1'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                BlocProvider.of<UsuarioBloc>(context).add(BorrarUsuario());
              },
              icon: Icon(Icons.delete))
        ],
      ),
      body: BlocBuilder<UsuarioBloc, UsuarioState>(
        builder: (_, state) {
          if (state.existeUsuario) {
            return HojaDeVidaUsuario(state.usuario!);
          } else {
            return const Center(
              child: Text('No hay datos de usuario'),
            );
          }
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
              subtitle: Text('${usuario.edad}'),
            ),

            // Profesiones
            const Text(
              'Profresiones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),

            ...usuario.profesiones
                .map((profesion) => ListTile(
                      title: Text(profesion),
                    ))
                .toList()
          ],
        ),
      ),
    );
  }
}
