import 'package:estados_app/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'config/router/app_router.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      title: 'Riverpod Providers',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme( isDarkmode: false ).getTheme(),
    );
  }
}