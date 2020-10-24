//
// TELA DE LOGIN
//
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sistema_especialista_flutter/menu.dart';

class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {

  String usuario = "";
  String senha = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 22),
                Text("Sistema Especialista em Manutenção", 
                  style: TextStyle(
                    fontSize: 20, 
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: Image.asset("assets/imagens/rodas_dentadas.jpg"),
                ),
                SizedBox(height: 30),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      onChanged: (text){ //Escutar o que foi digitado
                        usuario = text;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        icon: Icon(Icons.people),
                        labelText: "Usuário",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      onChanged: (text){ //Escutar o que foi digitado
                        senha = text;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        icon: Icon(Icons.lock),
                        labelText: "Senha",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 15),
                    RaisedButton(
                      child: Text("Entrar"),
                      onPressed: (){
                        setState(() { //Atualiza o estado da tela
                        
                          if(usuario == "fernando.pina" && senha == "123"){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MenuIniciar()));
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context){
                                return AlertDialog(
                                  title: Text('ATENÇÃO:'),
                                  content: Text('Login inválido.'),
                                  actions: <Widget>[
                                    TextButton(child: Text('Fechar'), onPressed: () {
                                      Navigator.pop(context, MaterialPageRoute(builder:(context) => TelaLogin()));
                                    }),
                                  ],
                                );
                              }
                            );
                          }
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: Text(""),
        ),
        color: Colors.yellow,
      )
    );
  }
}