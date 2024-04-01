import 'package:flutter/material.dart';

import 'pages/pagina1_page.dart';
import 'pages/pagina2_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routes:{
        '/pagina1':(_)=>Pagina1Page(),
        '/pagina2':(_)=>Pagina2Page(),
      },
      home: Pagina1Page()
    );
  }
}