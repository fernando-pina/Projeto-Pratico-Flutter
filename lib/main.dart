import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: Colors.yellow),
    title: 'Sistema Especialista de Manutenção',
    home: TelaLogin(),
  ));
}

//
// TELA DE LOGIN
//
class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  
  // Variáveis
  TextEditingController txtUsuario = TextEditingController();
  TextEditingController txtSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Login"),
      ),

      body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.people, size: 80, color: Colors.black),
                campoTexto("Usuário", txtUsuario),
                campoTexto("Senha", txtSenha),
                botaoLogar(context),
              ],
            ),
          ),
        ),

      backgroundColor: Colors.white,
    );
  }
}

//
// CAMPOS DE TEXTO (TELA LOGIN)
//
campoTexto(rotulo, controle){
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: TextFormField(
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 25),
      decoration: InputDecoration(
        labelText: rotulo,
        labelStyle: TextStyle(fontSize: 15, color: Colors.black),
      ),
      controller: controle,
      validator: (value) {
        return (value.isEmpty) ? "Usuário ou senha incorreto": null;
      }
    ),
  );
}

//
// BOTÃO LOGAR
//
botaoLogar(BuildContext context){
  return Container(
    padding: const EdgeInsetsDirectional.only(top: 20),
    child: RaisedButton(
      child: Text(
        "Login",
        style: TextStyle(
          color: Colors.red,
          fontSize: 18,
        ),
      ),
      color: Colors.yellow,
      onPressed: () {

      },
    )
  );
}