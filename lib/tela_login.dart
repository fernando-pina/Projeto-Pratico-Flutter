//
// TELA DE LOGIN
//
import 'dart:async';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sistema_especialista_flutter/menu.dart';

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

  //Lista Dinâmica de objetos da classe Café
  List<Usuario> usuarios = List();
  
  //Declaração de um objeto "ouvidor" da coleção Cafés do Firestore
  StreamSubscription<QuerySnapshot> ouvidor;

  @override
  void initState(){ //estado inicial quando a tela acabar de ser carregada
    super.initState();

    //Registrar o "ouvidor" para monitorar qualquer tipo de alteração
    //na coleção USUARIOS do FireStore
    ouvidor?.cancel();//cancelar qualquer 'ouvidor' que possa estar ocupando memória

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
                              // print("USUÁRIO");
                              // print(email);
                              // for(i = 0; i < usuarios.length; i++){
                              //   if(email == usuarios[i].email){
                              //     print(usuarios[i].id);
                              //     print(usuarios[i].email);
                              //     print(usuarios[i].senha);
                              //   }else{
                              //     print("Tentativa ");
                              //     print(i);
                              //   }
                              // }
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
                              // print("SENHA");
                              // print(password);
                              // for(i = 0; i < usuarios.length; i++){
                              //   if(password == usuarios[i].senha){
                              //     print(usuarios[i].id);
                              //     print(usuarios[i].email);
                              //     print(usuarios[i].senha);
                              //   }else{
                              //     print("Tentativa ");
                              //     print(i);
                              //   }
                              // }
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
                                  // print(i);
                                  // print("Dentro do 'For'... \n");
                                  // print("CAMPO 'USUARIO'... ");
                                  // print(email);
                                  // print("\n");
                                  // print("FIREBASE... ");
                                  // print(usuarios[i].email);
                                  // print("\n");
                                  // if(email == usuarios[i].email){
                                  //   print("Usuários 'IGUAIS'... ");
                                  // } else {
                                  //   print("Usuários 'DIFERENTES'... ");
                                  // }
                                  // print("\n");
                                  // print("CAMPO 'SENHA'... ");
                                  // print(password);
                                  // print("\n");
                                  // print("FIREBASE... ");
                                  // print(usuarios[i].senha);
                                  // print("\n");
                                  // if(password == usuarios[i].senha){
                                  //   print("Senhas 'IGUAIS'... ");
                                  // } else {
                                  //   print("Senhas 'DIFERENTES'... ");
                                  // }
                                  // print("\n");
                                  if(email == usuarios[i].email && password == usuarios[i].senha){
                                    _flag = 1;
                                    break;
                                  }
                                }

                                // print("Flag... ");
                                // print(_flag);
                                // print("\n");
                                
                                if (_flag == 1) {
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
                                //if(usuario == "fernando.pina" && senha == "123"){
                                //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MenuIniciar()));
                                // } else {
                                //   showDialog(
                                //     context: context,
                                //     builder: (BuildContext context){
                                //       return AlertDialog(
                                //         title: Text('ATENÇÃO:'),
                                //         content: Text('Login inválido.'),
                                //         actions: <Widget>[
                                //           TextButton(child: Text('Fechar'), onPressed: () {
                                //             Navigator.pop(context, MaterialPageRoute(builder:(context) => TelaLogin()));
                                //           }),
                                //         ],
                                //       );
                                //     }
                                //   );
                                //}
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
