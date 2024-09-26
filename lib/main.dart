import 'package:flutter/material.dart';
import 'view/login_view.dart';
import 'view/cidade_view.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MVP App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginView(),
        '/city': (context) => CidadeView(),
      },
    );
  }
}
