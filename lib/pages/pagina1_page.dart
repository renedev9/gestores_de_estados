import 'package:flutter/material.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pagina 1'),),
      body: const InformacionUsuario(),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pushNamed(context, '/pagina2');
      }),
      );
  }
}

class InformacionUsuario extends StatelessWidget {
  const InformacionUsuario({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(children: [
        Text('General',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
        Divider(),
        ListTile(title: Text('Nombre'),),
        ListTile(title: Text('Edad'),),
        Text('Profesiones',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
        Divider(),
        ListTile(title: Text('Profesion1'),),
        ListTile(title: Text('Profesion2'),),
        ListTile(title: Text('Profesion3'),)
      ],));
  }
}