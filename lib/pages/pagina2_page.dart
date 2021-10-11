import 'package:flutter/material.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página 2'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: () {}, child: Text('Establecer Usuario')),
            ElevatedButton(onPressed: () {}, child: Text('Cambiar Edad')),
            ElevatedButton(onPressed: () {}, child: Text('Añadir Profesión')),
          ],
        ),
      ),
    );
  }
}
