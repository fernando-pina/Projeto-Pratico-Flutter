import 'package:flutter/material.dart';
import 'package:sistema_especialista_flutter/tela_login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: Colors.yellow),
    title: 'Sistema Especialista em Manutenção',
    home: TelaLogin(),
  ));
}