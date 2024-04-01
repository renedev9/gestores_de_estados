import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';


import '../../models/usuario.dart';

part 'usuario_state.dart';
part 'usuario_event.dart';

class UsuarioBloc extends Bloc<UsuarioEvent,UsuarioState>{
  UsuarioBloc():super (UsuarioState()){
    on<ActivarUsuario>((event, emit) => emit(UsuarioState(user: event.usuario)));
    on<CambiarEdad>((event, emit) =>emit(state.copyWith(user: state.usuario.copyWith(edad: event.edad))
    ));
    on<AgregarProfesion>((event, emit) {
      List<String>profesiones= state.usuario.profesiones!;
      profesiones.add('Profesion ${state.usuario.profesiones!.length+1}');
     return emit(state.copyWith(user:state.usuario.copyWith(profesiones: profesiones))
    );
    });
    on<EliminarUsuario>((event, emit) => emit(state.estadoInicial())
    );
  }

  
 }

 /* @override
  Stream<UsuarioState> onEvent(UsuarioEvent event) async*{
    print(event);

    if(event is ActivarUsuario){

    yield UsuarioState(user:event.usuario);
    }

  }

@override
  void onChange(Change<UsuarioState> change) {
    // TODO: implement onChange
   
  }

  @override
  void onTransition(Transition<UsuarioEvent, UsuarioState> transition) {
    // TODO: implement onTransition
    
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    
  }  */

