import 'package:estados_app/bloc/usuario/usuario_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/usuario.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {
    final bloCubit= BlocProvider.of<UsuarioCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
        actions: [
          IconButton(onPressed: ()=> bloCubit.borrarUsuario(), icon: Icon(Icons.logout))
        ],
      ),
      body: BodyScaffold(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pushNamed(context, '/pagina2');
      }),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  const BodyScaffold({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: (context, state) {
        print(state);
        if (state is UsuarioInitial) {
          return Center(
            child: Text('No existe informacion del usuario'),
          );
        } else if (state is UsuarioActivo) {
          return InformacionUsuario(
            usuario: state.usuario,
          );
        }else{
          return Center(child:Text('Estado no reconocido'));
        }
      },
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
            ...usuario.profesiones!
                .map((profesiones) => ListTile(
                      title: Text(profesiones),
                    ))
                .toList(),
          ],
        ));
  }
}
