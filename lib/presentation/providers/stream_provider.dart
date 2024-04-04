import 'package:estados_app/config/config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


//? Este stream se va a ejecutar todo el tiempo hasta terminar sino se pone el StreamProvider.autodispose para limpiar el listado de nombres
final usersInChatProvider = StreamProvider<List<String>>((ref) async* {
  final names=<String>[];
  //yield []; //*Se hace un lanzamiento inicial del stream, se quita porque se ejecuta muy rapido por lo cual no se veria el CircularProgress
  
  //*Espera que se barran todos los elementos generados por RandomGenerator, para lanzar despues la lista con el nombre añadido iterablemente
  await for(final name in RandomGenerator.randomNameStream()){
   names.add(name);
    yield names;
  }

});