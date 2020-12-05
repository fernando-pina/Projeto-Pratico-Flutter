//
// TELA DE MENU
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
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            RaisedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/cadastroClientes');
              },
              child: Text("Cadastrar Cliente"),
            ),

            SizedBox(height: 10),
            
            RaisedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/listaClientes');
              },
              child: Text("Ver Lista de Cliente"),
            ),

            SizedBox(height: 10),
 
            RaisedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/ordemServico');
              },
              child: Text("Abrir Ordem de Serviço"),
            ),

            SizedBox(height: 10),
 
            RaisedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/listaOrdensServicos');
              },
              child: Text("Ver Lista de Ordens de Serviços"),
            ),

            SizedBox(height: 10),
 
            RaisedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/sobre');
              },
              child: Text("Sobre o Sistema"),
            ),

            SizedBox(height: 10),
 
            RaisedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/login');
              },
              child: Text("Logoff"),
            ),

            SizedBox(height: 10),
 
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