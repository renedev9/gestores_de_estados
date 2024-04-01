import '../models/usuario.dart';

class _UsuarioService{
  Usuario? _usuario;

  Usuario get usuario=>_usuario!;

  bool get existeUsuario=> (_usuario!=null) ?true:false;

  void cargarUsuario(Usuario user){
    _usuario=user;
  }
}

final usuarioService= _UsuarioService();