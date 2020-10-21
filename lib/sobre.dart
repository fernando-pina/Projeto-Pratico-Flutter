//
// TELA DE INFORMAÇÕES SOBRE O APLICATIVO
//
import 'package:flutter/material.dart';

class Sobre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sistema Especialista em Manutenção")),
      body:Center(child: Text("Informações sobre este App...")),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.yellow,
        )
      ),
    );
  }
}