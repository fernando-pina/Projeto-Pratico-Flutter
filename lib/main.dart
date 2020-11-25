// import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sistema_especialista_flutter/tela_login.dart';

void main() async{

  //Registrar o Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: Colors.yellow),
    title: 'Sistema Especialista em Manutenção',
    home: TelaLogin(),
  ));
}