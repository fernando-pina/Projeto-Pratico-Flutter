//
// TELA DE LOGIN
//
import 'dart:async';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:sistema_especialista_flutter/menu.dart';

import 'model/usuarios.dart';


class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {

  //Variável para conseguir manipular os dados do banco
  var db = FirebaseFirestore.instance;
  var usuario = TextEditingController();
  var senha = TextEditingController();
  String email = "";
  String password = "";
  int i = 0;

  //Lista Dinâmica de objetos da classe Usuário
  List<Usuario> usuarios = List();
  
  //Declaração de um objeto "ouvidor" da coleção Usuários do Firestore
  StreamSubscription<QuerySnapshot> ouvidor;

  @override
  void initState(){
    super.initState();

    ouvidor?.cancel();

    ouvidor = db.collection("usuarios").snapshots().listen( (res) {
      setState(() {
        usuarios = res.docs.map((e) => Usuario.fromMap(e.data(), e.id)).toList();
      });
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection("usuarios").snapshots(),
        builder: (context, snapshot) {
          switch(snapshot.connectionState){
            case ConnectionState.none:
              return Center(child: Text("Erro ao conectar no Firebase."));
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default: return SizedBox(
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
                            controller: usuario,
                            onChanged: (text){ //Escutar o que foi digitado
                              email = text;
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
                            controller: senha,
                            onChanged: (text){ //Escutar o que foi digitado
                              password = text;
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

                                int _flag = 0;

                                for(i = 0; i < usuarios.length; i++){
                                  if(email == usuarios[i].email && password == usuarios[i].senha){
                                    _flag = 1;
                                    break;
                                  }
                                }
                                
                                if (_flag == 1) {
                                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MenuIniciar()));
                                    Navigator.pushNamed(context, '/menu');
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
            ); 
          }
          
        }
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
