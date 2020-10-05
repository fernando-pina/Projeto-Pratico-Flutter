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

      body: Center(
          //padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formkey,
            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                
                SizedBox(
                  width: 300,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(50.0),
                        child: //image: //Imagem que represente o LOGOTIPO do App
                        Icon(Icons.build, size: 80, color: Colors.black),
                      ),
                      campoTexto("Usuário", "Insira seu usuário aqui", Icon(Icons.perm_identity), txtUsuario, false),
                      campoTexto("Senha", "Insira sua senha aqui", Icon(Icons.lock), txtSenha, true),
                      botaoLogar(context),
                    ],
                  ),
                ),
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
campoTexto(rotulo, preenchimento, icone, controle, visibilidade){
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: TextFormField(
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 25),
      decoration: InputDecoration(
        labelText: rotulo,
        labelStyle: TextStyle(fontSize: 15, color: Colors.black),
        hintText: preenchimento,//"Insira seu usuário aqui",
        icon: icone,//Icon(Icons.lock),
      ),
      controller: controle,
      validator: (value) {
        return (value.isEmpty) ? "Usuário ou senha incorreto": null;
      },
      obscureText: visibilidade,
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