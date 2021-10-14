import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manejo_estados/bloc/usuario/usuario_bloc.dart';
import 'package:manejo_estados/models/usuario.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioBloc = BlocProvider.of<UsuarioBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<UsuarioBloc, UsuarioState>(
          builder: (_, state) {
            return state.existeUsuario 
            ? Text('${state.usuario!.nombre} - ${state.usuario!.edad} años - ${state.usuario!.profesiones.length} profesiones')
            :Text('Página 2');
          },
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  // Crear informacion de usaurio
                  final usuario = Usuario(
                      nombre: 'Oscar Giraldo',
                      edad: 28,
                      profesiones: ['Android Developer', 'Flutter Developer']);

                  // Disparar un nuevo evento, que genere una reaccion en la UI.
                  usuarioBloc.add(CargarUsuario(usuario));

                },
                child: Text('Establecer Usuario')),
            ElevatedButton(
                onPressed: () {

                  // Disparar un nuevo evento, que genere una reaccion en la UI.
                  usuarioBloc.add(CambiarEdad());

                },
                child: Text('Cambiar Edad')),
            ElevatedButton(
                onPressed: () {

                  // Disparar un nuevo evento, que genere una reaccion en la UI.
                  usuarioBloc.add(AgregarProfesion());

                },
                child: Text('Añadir Profesión')),
          ],
        ),
      ),
    );
  }
}
