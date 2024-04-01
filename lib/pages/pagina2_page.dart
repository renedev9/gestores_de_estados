import 'package:estados_app/models/usuario.dart';
import 'package:estados_app/services/usuario_service.dart';
import 'package:flutter/material.dart';

class Pagina2Page extends StatefulWidget {
  const Pagina2Page({super.key});

  @override
  State<Pagina2Page> createState() => _Pagina2PageState();
}

class _Pagina2PageState extends State<Pagina2Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: StreamBuilder(
            stream: usuarioService.usuarioStream,
             builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
              return snapshot.hasData
              ?Center(
              child: Text(
          snapshot.data!.nombre!,
            style: TextStyle(color: Colors.white),
          ))
              :Text('No tiene nombre') ;
              
            },
          ),
          backgroundColor: Colors.blue,
        ),
        body: Center(
            child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Usuario usuario = Usuario(
                      nombre: 'Rene',
                      edad: 27,
                      profesiones: [
                        'Desarrollador App moviles',
                        'Desarrollador App web',
                        'Tested'
                      ]);
                  usuarioService.cargarUsuario(usuario);
                },
                child: Text('Establecer Usuario')),
            ElevatedButton(
                onPressed: () {
                  usuarioService.setEdad(28);
                },
                child: Text('Cambiar Edad')),
            ElevatedButton(onPressed: () {}, child: Text('Añadir Profesion')),
          ],
        )));
  }
}
