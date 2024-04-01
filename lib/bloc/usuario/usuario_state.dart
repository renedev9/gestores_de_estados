part of 'usuario_bloc.dart';


class UsuarioState{

  final bool existeUsuario;
  final Usuario usuario;

  factory UsuarioState({Usuario? user}) {
    // Si user es nulo, inicializa usuario con un valor por defecto
    // y existeUsuario con false.
    if (user == null) {
      return UsuarioState._internal(existeUsuario: false, usuario: Usuario());
    }
    // Si user no es nulo, inicializa usuario con user
    // y existeUsuario con true.
    return UsuarioState._internal(existeUsuario: true, usuario: user);
 }

 UsuarioState copyWith({Usuario? user})=> UsuarioState(
  user: usuario
 );

  UsuarioState estadoInicial()=> UsuarioState();

 // Constructor privado
 UsuarioState._internal({required this.existeUsuario, required this.usuario});
}

