import 'package:estados_app/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


class RouterScreen extends ConsumerWidget {
  const RouterScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider + Go Router'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.arrow_back_ios_new_rounded ),
        onPressed: () {
          //*No es recomendable dentro de una funcion utilizar .watch() porque fuerza el redibujo del widget, deberia ser solo lectura, por eso se usa read()
          //*Para esto es necesario incluir un provider dentro de goRouter o las rutas, en este caso appRouterProvider
          //*Tambien se pudiera utilizar el context.pop();, pero en algunos casos puede hacer falta declarar un provider para las rutas por si el contexto no es accesible en dicho metodo
          
          ref.read(appRouterProvider).pop();
          
        },
      ),
    );
  }
}