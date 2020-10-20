import 'package:flutter/material.dart';
//import 'package:sistema_especialista_flutter/menu.dart';
//import 'package:sistema_especialista_flutter/tela_login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: Colors.yellow),
    title: 'Sistema Especialista em Manutenção',
    //home: MenuIniciar(),
    //home: TelaLogin(),
    initialRoute: '/login',
    routes: {
      '/login': (context) => TelaLogin(),
      '/menu': (context) => MenuIniciar(),
      //'/cadastro_cliente': (context) => ???,
    },
  ));
}


//
// TELA DE MENU
//
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
            RaisedButton(onPressed: (){},
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


//
// TELA DE LOGIN
//
//import 'package:flutter/material.dart';

class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {

  String usuario = "";
  String senha = "";

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onChanged: (text){//Escutar o que foi digitado
                  usuario = text;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
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
                labelText: "Senha",
                border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              RaisedButton(
                onPressed: (){
                  if(usuario == "fernando.pina" && senha == "123456"){
                    Navigator.pushReplacementNamed(context, '/menu');
                  } else {
                    print("Login inválido.");
                  }
                },
                child: Text("Entrar"),
              )
            ],
          ),
        ),
      ),
    );
  }
}