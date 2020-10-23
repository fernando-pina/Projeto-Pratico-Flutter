//
// TELA DE MENU
//
import 'package:flutter/material.dart';
import 'package:sistema_especialista_flutter/cadastro_cliente.dart';
import 'package:sistema_especialista_flutter/ordem_servico.dart';
import 'package:sistema_especialista_flutter/sobre.dart';
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
            RaisedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => CadastroClientes()));
              },
              child: Text("Cadastrar Cliente"),
            ),

            RaisedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => OrdemServico()));
              },
              child: Text("Abrir Ordem de Serviço"),
            ),

            RaisedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Sobre()));
              },
              child: Text("Sobre o Sistema"),
            ),

            RaisedButton(
              onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TelaLogin()));
              },
              child: Text("Logoff"),
            ),

            RaisedButton(
              onPressed: (){},
              child: Text("Sair do Sistema"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: Text("Sistema Especialista em Manutenção"),
        ),
        color: Colors.yellow,
      )
    );
  }
}