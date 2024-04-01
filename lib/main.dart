import 'package:estados_app/bloc/usuario/usuario_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pages/pagina1_page.dart';
import 'pages/pagina2_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UsuarioBloc(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: '/pagina1',
        routes:{
          '/pagina1':(_)=>Pagina1Page(),
          '/pagina2':(_)=>Pagina2Page(),
        },
        
      ),
    );
  }
}