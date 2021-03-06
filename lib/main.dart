import 'package:flutter/material.dart';
import 'package:manejo_estados/pages/pagina1_page.dart';
import 'package:manejo_estados/pages/pagina2_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Manejo Estados',
      initialRoute: 'pag1',
      routes: {
        'pag1' : ( _ ) => Pagina1Page(),
        'pag2' : ( _ ) => Pagina2Page()
      },
    );
  }
}