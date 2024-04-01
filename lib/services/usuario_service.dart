import 'dart:async';

import '../models/usuario.dart';

class _UsuarioService{
  Usuario? _usuario;
  Usuario get usuario=>_usuario!;
  final StreamController<Usuario> _usuarioStreamController=StreamController<Usuario>.broadcast();

  bool get existeUsuario=> (_usuario!=null) ?true:false;

  Stream<Usuario> get usuarioStream => _usuarioStreamController.stream;

  void cargarUsuario(Usuario user){
    _usuario=user;
    _usuarioStreamController.add(user);
  }
  void setEdad(int edad){
    _usuario!.edad=edad;
    _usuarioStreamController.add(_usuario!);
  }

  dispose() {
    _usuarioStreamController.close();
    
  }
}

final usuarioService= _UsuarioService();
