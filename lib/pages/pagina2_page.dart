import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/usuario/usuario_bloc.dart';
import '../models/usuario.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioBloc = BlocProvider.of<UsuarioBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: BlocBuilder<UsuarioBloc, UsuarioState>(
            builder: (context, state) {
              if(state.existeUsuario){
                return Center(child:Text(state.usuario.nombre!));
              }else{

             return Text(
            'Pagina 2',
            style: TextStyle(color: Colors.white),
          );
              }
            },
          ),
          backgroundColor: Colors.blue,
        ),
        body: Center(
            child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Usuario newUsuer =
                      Usuario(edad: 27, nombre: 'Rene', profesiones: [
                    'desarrollador app movil',
                    'desarrollador app web',
                    'tested',
                  ]);
                  usuarioBloc.add(ActivarUsuario(usuario: newUsuer));
                },
                child: Text('Establecer Usuario')),
            ElevatedButton(
                onPressed: () {
                  usuarioBloc.add(CambiarEdad(edad: 28));
                },
                child: Text('Cambiar Edad')),
            ElevatedButton(onPressed: () {
              usuarioBloc.add(AgregarProfesion());
            }, child: Text('Añadir Profesion')),
          ],
        )));
  }
}
