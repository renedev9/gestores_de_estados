import 'package:flutter/material.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pagina 2',style: TextStyle(color: Colors.white),),backgroundColor: Colors.blue,),
      body: Center(child:Column(children: [
        ElevatedButton(onPressed: (){}, child: Text('Establecer Usuario')),
        ElevatedButton(onPressed: (){}, child: Text('Cambiar Edad')),
        ElevatedButton(onPressed: (){}, child: Text('Añadir Profesion')),
      ],)));
  }
}