import 'package:flutter/material.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página 1'),
        centerTitle: true,
      ),
      body: HojaDeVidaUsuario(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.navigate_next),
          onPressed: () => Navigator.pushNamed(context, 'pag2')),
    );
  }
}

class HojaDeVidaUsuario extends StatelessWidget {
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
              title: Text('Nombre completo:'),
              subtitle: Text('Oscar David Giraldo Velasco'),
            ),
            ListTile(
              title: Text('Número de cedula:'),
              subtitle: Text('1151948300'),
            ),
            ListTile(
              title: Text('Edad:'),
              subtitle: Text('28 años'),
            ),
            ListTile(
              title: Text('Titulo:'),
              subtitle: Text('Ingeniero de Sistemas'),
            ),

            // Profesiones
            Text(
              'Profresiones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Divider(),

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
