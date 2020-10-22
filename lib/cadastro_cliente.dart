//
// TELA DE CADASTRO DE CLIENTE
//
import 'package:flutter/material.dart';

class CadastroClientes extends StatefulWidget {
  @override
  _CadastroClientesState createState() => _CadastroClientesState();
}

class _CadastroClientesState extends State<CadastroClientes> {
  
  //String msg = "";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cadastro de Clientes")),
      body:Center(child: Text("Formulários...")),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: Text("Sistema Especialista em Manutenção"),
        ),
        color: Colors.yellow,
      )
    );
  }
}