import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/usuario.dart';

part 'usuarios_state.dart';

class UsuarioCubit extends Cubit<UsuarioState>{
  UsuarioCubit() : super(UsuarioInitial());
  
void seleccionarUsuario(Usuario user){
  emit(UsuarioActivo(user));
}

void cambiarEdad(int edad){
  final currentState=state;
  if(currentState is UsuarioActivo){
    final newUser= currentState.usuario.copyWith(edad: edad);
    emit(UsuarioActivo(newUser));
  }
}

void agregarProfesion(){
  final currentState= state;
  if(currentState is UsuarioActivo){
    
   List<String> profesionesAux= currentState.usuario.profesiones!;
   profesionesAux.add('Profesion ${currentState.usuario.profesiones!.length+1}');
    final newUser= currentState.usuario.copyWith(profesiones: profesionesAux);
    emit(UsuarioActivo(newUser));
  }
}

void borrarUsuario(){
  emit(UsuarioInitial());
}

}