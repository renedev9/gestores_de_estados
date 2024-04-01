import 'package:estados_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/usuario/usuario_cubit.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioCubit= BlocProvider.of<UsuarioCubit>(context);
    return Scaffold(
        appBar: AppBar(
          title: BlocBuilder<UsuarioCubit, UsuarioState>(
            builder: (context, state) {
              if(state is UsuarioActivo){
                return Center(child: Text(state.usuario.nombre!),);
              }else{
                return Center(child: Text('Pagina2'),);
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
                  final Usuario usuario =
                      Usuario(edad: 27, nombre: 'Rene', profesiones: [
                    'Desarrollador de app movil'
                    'Desarrollador de app web',
                    'Tested',
                  ]);

                  usuarioCubit.seleccionarUsuario(usuario);
                },
                child: Text('Establecer Usuario')),
            ElevatedButton(onPressed: () {
              usuarioCubit.cambiarEdad(28);
            }, child: Text('Cambiar Edad')),
            ElevatedButton(onPressed: () {
              usuarioCubit.agregarProfesion();
            }, child: Text('Añadir Profesion')),
          ],
        )));
  }
}
