import 'package:estados_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/usuario_service.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            usuarioService.existeUsuario
            ?usuarioService.usuario.nombre!
            :'Pagina2',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Center(
            child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  final usuario =
                      Usuario(nombre: 'Rene', edad: 27, profesiones: [
                    'Desarrollador movil',
                    'Desarrollador Web',
                    'Tested',
                  ]);
                  usuarioService.usuario = usuario;
                },
                child: Text('Establecer Usuario')),
            ElevatedButton(
                onPressed: () {
                  usuarioService.cambiarEdad(28);
                },
                child: Text('Cambiar Edad')),
            ElevatedButton(onPressed: () {
              usuarioService.addUsuario();
            }, child: Text('Añadir Profesion')),
          ],
        )));
  }
}
