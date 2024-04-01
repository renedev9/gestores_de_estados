import 'package:estados_app/bloc/usuario/usuario_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/usuario.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioBloc= BlocProvider.of<UsuarioBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
        actions: [
          IconButton(onPressed: (){
            usuarioBloc.add(EliminarUsuario());
          }, icon: Icon(Icons.delete)),
        ],
      ),
      body: BlocBuilder<UsuarioBloc, UsuarioState>(
        builder: (context, state) {
          if (state.existeUsuario) {
            return InformacionUsuario(
              usuario: state.usuario,
            );
          } else {
            return Center(
              child: Text('NO hay usuario seleccionado'),
            );
          }
        },
      ),
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
              title: Text(usuario.edad.toString()),
            ),
            Text(
              'Profesiones',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Divider(),
            ...usuario.profesiones!
                .map((profesion) => ListTile(
                      title: Text(profesion),
                    ))
                .toList(),
          ],
        ));
  }
}
