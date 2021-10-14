import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manejo_estados/pages/pagina1_page.dart';
import 'package:manejo_estados/pages/pagina2_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Manejo Estados',
      initialRoute: '/pag1',
      // routes: {
      //   'pag1' : ( _ ) => Pagina1Page(),
      //   'pag2' : ( _ ) => Pagina2Page()
      // },
      getPages: [
        GetPage(name: '/pag1', page: () => Pagina1Page()),
        GetPage(name: '/pag2', page: () => Pagina2Page()),
      ],
    );
  }
}
