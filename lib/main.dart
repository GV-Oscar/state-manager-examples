import 'package:flutter/material.dart';
import 'package:manejo_estados/pages/pagina1_page.dart';
import 'package:manejo_estados/pages/pagina2_page.dart';
import 'package:manejo_estados/services/usuario_service.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UsuarioService())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Manejo Estados',
        initialRoute: 'pag1',
        routes: {
          'pag1': (_) => Pagina1Page(), 
          'pag2': (_) => Pagina2Page()
        },
      ),
    );
  }
}
