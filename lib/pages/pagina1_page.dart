import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manejo_estados/bloc/usuario/usuario_cubit.dart';
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
              onPressed: () => context.read<UsuarioCubit>().borrarUsuario(),
              icon: Icon(Icons.delete))
        ],
      ),
      body: BodyScaffold(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.navigate_next),
          onPressed: () => Navigator.pushNamed(context, 'pag2')),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  const BodyScaffold({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(builder: (context, state) {
      // Opcion con #1
      switch (state.runtimeType) {
        case UsuarioInitial:
          return const Center(child: Text('No hay datos de usuario'));

        case UsuarioCargado:
          return HojaDeVidaUsuario((state as UsuarioCargado).usuario);

        default:
          return const Center(child: Text('No se reconoce el estado'));
      }

      /*
      // Opcion #2
      if (state is UsuarioInitial) {
        // El estado inicial no contiene datos de un usuario
        return Center(child: Text('No hay datos de usuario'));
      } else if (state is UsuarioCargado) {
        // Estado contiene datos de usuario
        return HojaDeVidaUsuario(state.usuario);
      } else {
        return Center(child: Text('No se reconoce el estado del usuario'));
      }
     */
    });
  }
}

class HojaDeVidaUsuario extends StatelessWidget {
  final Usuario usuario;
  HojaDeVidaUsuario(this.usuario);

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
                .map((e) => ListTile(
                      title: Text(e),
                    ))
                .toList()
          ],
        ),
      ),
    );
  }
}
