import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/usuario.dart';
import '../services/usuario_service.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
        actions: [
          IconButton(
              onPressed: () {
                usuarioService.removerUsuario();
              },
              icon: Icon(Icons.delete))
        ],
      ),
      body: usuarioService.existeUsuario
          ? InformacionUsuario(
              usuario: usuarioService.usuario,
            )
          : Center(child: Text('No hay usuario seleccionado')),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pushNamed(context, '/pagina2');
      }),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;
  const InformacionUsuario({
    super.key,
    required this.usuario,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Text(
              'General',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Divider(),
            ListTile(
              title: Text(usuario.nombre!),
            ),
            ListTile(
              title: Text(usuario.edad!.toString()),
            ),
            Text(
              'Profesiones',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Divider(),
            //Desestructruacion en flutter para una lista, en vez de usar un listView.builder
            ...usuario.profesiones!
                .map((profesiones) => ListTile(
                      title: Text(profesiones),
                    ))
                .toList(),
          ],
        ));
  }
}
