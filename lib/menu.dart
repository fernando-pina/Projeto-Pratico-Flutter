//
// TELA DE MENU
//
import 'package:flutter/material.dart';
import 'package:sistema_especialista_flutter/tela_login.dart';

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
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            RaisedButton(onPressed: (){},
            child: Text("Cadastrar Cliente")),
            RaisedButton(onPressed: (){},
            child: Text("Abrir Ordem de Serviço")),
            RaisedButton(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TelaLogin()));
            },
            child: Text("Logoff")),
            RaisedButton(onPressed: (){},
            child: Text("Sair do Sistema")),
            RaisedButton(onPressed: (){},
            child: Text("Sobre o Sistema")),
          ],
        ),
      ),
    );
  }
}