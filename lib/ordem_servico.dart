//
// TELA DE ABERTURA DE ORDEM DE SERVIÇOS
//
import 'package:flutter/material.dart';

class OrdemServico extends StatefulWidget {
  @override
  _OrdemServicoState createState() => _OrdemServicoState();
}

class _OrdemServicoState extends State<OrdemServico> {
  
  String msg = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Abertura de Ordem de Serviços")),
      body:Center(child: Text("Formulários / Botão ENVIAR/ Botão ???")),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: Text(msg),
          color: Colors.yellow,
        )
      ),
    );
  }
}