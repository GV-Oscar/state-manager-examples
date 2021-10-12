import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manejo_estados/bloc/usuario/usuario_cubit.dart';
import 'package:manejo_estados/pages/pagina1_page.dart';
import 'package:manejo_estados/pages/pagina2_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UsuarioCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Manejo Estados',
        initialRoute: 'pag1',
        routes: {
          'pag1' : ( _ ) => Pagina1Page(),
          'pag2' : ( _ ) => Pagina2Page()
        },
      ),
    );
  }
}