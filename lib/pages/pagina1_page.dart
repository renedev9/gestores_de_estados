import 'package:estados_app/models/usuario.dart';
import 'package:estados_app/services/usuario_service.dart';
import 'package:flutter/material.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Pagina 1',style: TextStyle(color: Colors.white),)),backgroundColor: Colors.blue,automaticallyImplyLeading: true,),
      body: StreamBuilder(
        stream: usuarioService.usuarioStream,
        builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
          return snapshot.hasData
      ? InformacionUsuario(usuario: usuarioService.usuario,)
      :Center(child: Text('No existe informacion del usuario'),);
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pushNamed(context, '/pagina2');
      },
      backgroundColor: Colors.blue,
      ),
      );
  }
}

class InformacionUsuario extends StatelessWidget {
  Usuario usuario;
   InformacionUsuario({
    super.key,
    required this.usuario
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(children: [
        Text('General',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
        Divider(),
        ListTile(title: Text(usuario.nombre!),),
        ListTile(title: Text(usuario.edad!.toString()),),
        Text('Profesiones',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
        Divider(),
        ListTile(title: Text(usuario.profesiones!.first),),
        ListTile(title: Text(usuario.profesiones!.first),),
        ListTile(title: Text(usuario.profesiones!.last),)
      ],));
  }
}