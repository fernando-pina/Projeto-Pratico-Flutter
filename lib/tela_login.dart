//
// TELA DE LOGIN
//
import 'package:flutter/material.dart';
import 'package:sistema_especialista_flutter/menu.dart';

class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {

  String usuario = "";
  String senha = "";
  String msg = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold( //Material(
      appBar: AppBar(title: Text("Login")),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("INSERIR IMAGEM AQUI!!!"),
              TextField(
                onChanged: (text){//Escutar o que foi digitado
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
                onChanged: (text){//Escutar o que foi digitado
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
                onPressed: (){
                  if(usuario == "fernando.pina" && senha == "123"){
                    msg = "Logando...";
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MenuIniciar()));
                  } else {
                    msg = "ATENÇÃO! Login inválido.";
                  }
                },
                child: Text("Entrar"),
              )
            ],
          ),
        ),
      ),
      //setState ??? como usar???
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: Text(msg),
          color: Colors.yellow,
        )
      ),
    );
  }
}