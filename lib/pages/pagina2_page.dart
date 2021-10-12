import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manejo_estados/bloc/usuario/usuario_cubit.dart';
import 'package:manejo_estados/models/usuario.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtener el cubit del contexto global; esto es gracias a que en el main lo inicializamos.
    final usuarioCubit = context.read<UsuarioCubit>();

    return Scaffold(
      appBar: AppBar(
        title: TitleBuilder(),
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
                      profesiones: ['Android Developer', 'Flutter Developer']);
                  usuarioCubit.establecerUsuario(usuario);
                },
                child: Text('Establecer Usuario')),
            ElevatedButton(
                onPressed: () {
                  if (usuarioCubit.state is UsuarioCargado) {
                    final usuario =
                        (usuarioCubit.state as UsuarioCargado).usuario;
                    usuarioCubit.cambiarEdad(usuario.edad + 1);
                  }
                },
                child: Text('Cambiar Edad')),
            ElevatedButton(
                onPressed: () {
                  usuarioCubit.agregarProfesion();
                },
                child: Text('Añadir Profesión')),
          ],
        ),
      ),
    );
  }
}

class TitleBuilder extends StatelessWidget {
  const TitleBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case UsuarioInitial:
            return Text('Página 2');

          case UsuarioCargado:
            final usuario = (state as UsuarioCargado).usuario;
            return Text(
                '${usuario.nombre} - ${usuario.edad} años - ${usuario.profesiones!.length} profesiones');
          default:
            return Text('Sin estado');
        }
      },
    );
  }
}
