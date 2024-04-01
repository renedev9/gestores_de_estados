part of 'usuario_bloc.dart';


@immutable
abstract class UsuarioEvent{}

class ActivarUsuario extends UsuarioEvent{
  final Usuario usuario;

  ActivarUsuario({required this.usuario});

}

class CambiarEdad extends UsuarioEvent{
  final int edad;

  CambiarEdad({required this.edad});
}

class AgregarProfesion extends UsuarioEvent{
  AgregarProfesion();
}

class EliminarUsuario extends UsuarioEvent{
  EliminarUsuario();
}