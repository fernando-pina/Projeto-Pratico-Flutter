//
// TELA DE BASE DE DADOS DOS CLIENTES
//
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'model/clientes.dart';

class BaseClientes extends StatefulWidget {
  @override
  _BaseClientesState createState() => _BaseClientesState();
}

class _BaseClientesState extends State<BaseClientes> {

  //Variável para conseguir manipular os dados do banco
  var db = FirebaseFirestore.instance;

   //Lista Dinâmica de objetos da classe Cliente
  List<Cliente> clientes = List();

  //Declaração de um objeto "ouvinte" da coleção Clientes do Firestore
  StreamSubscription<QuerySnapshot> ouvidor;

  @override
  void initState(){ 
    super.initState();

    ouvidor?.cancel();

    ouvidor = db.collection("clientes").snapshots().listen( (res) {

      setState(() {
        //conversão dos documentos em uma Lista Dinânica
        //a versão mais recente da coleção de documentos será mapeada na Lista Dinâmica
        clientes = res.docs.map((e) => Cliente.fromMap(e.data(), e.id)).toList();
      });

    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clientes Cadastrados",),
        actions: [
          IconButton(
            icon: Icon(Icons.home_outlined),
            onPressed: (){
              Navigator.pushNamed(context, '/menu');
            },
          )
        ],
      ),
      
      body: StreamBuilder<QuerySnapshot>(

        stream: db.collection("clientes").snapshots(),
        builder: (context,snapshot){

          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(child: Text("Erro ao conectar no Firebase"));
            case ConnectionState.waiting:  
              return Center(child: CircularProgressIndicator());
            default: return ListView.builder(
                itemCount: clientes.length,
                itemBuilder: (context,index){

                  return ListTile(

                    title: Text(clientes[index].nome, style: TextStyle(fontSize: 24)),
                    subtitle: Text("CONTATO:   "+clientes[index].emailContato, style: TextStyle(fontSize: 15)),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: (){
                        //Apagar o documento selecionado
                        db.collection("clientes").doc(clientes[index].id).delete();
                      },
                    ),

                    onTap: (){
                      //Abrir a tela de Cadastro passando o ID
                      //do documento como parâmetro  
                      Navigator.pushNamed(
                        context, '/cadastroClientes',
                        arguments: clientes[index].id
                      );
                    }
                  );
                }
            );
          }
        }
      ),

      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.black,
        backgroundColor: Colors.yellow,
        elevation: 0,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/cadastroClientes', arguments: null);
        },
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