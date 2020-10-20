//
// MENU
//
import 'package:flutter/material.dart';

class MenuIniciar extends StatefulWidget {
  @override
  MenuIniciarState createState() => MenuIniciarState();
}

class MenuIniciarState extends State<MenuIniciar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
      ),
      body: Center(
        child: Text("Teste"),
      ),
    );
  }
}