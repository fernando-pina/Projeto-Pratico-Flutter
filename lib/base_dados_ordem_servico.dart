//
// TELA DE BASE DE DADOS DAS ORDENS DE SERVIÇOS
//
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'model/ordem_de_servico.dart';


class BaseOrdensServicos extends StatefulWidget {
  @override
  _BaseOrdensServicosState createState() => _BaseOrdensServicosState();
}

class _BaseOrdensServicosState extends State<BaseOrdensServicos> {

  //Variável para conseguir manipular os dados do banco
  var db = FirebaseFirestore.instance;

   //Lista Dinâmica de objetos da classe Ordem de Serviço
  List<OrdemDeServico> ordensDeServicos = List();

  //Declaração de um objeto "ouvinte" da coleção Ordens de Serviços do Firestore
  StreamSubscription<QuerySnapshot> ouvidor;

  @override
  void initState(){ 
    super.initState();

    ouvidor?.cancel();

    ouvidor = db.collection("ordens de servico").snapshots().listen( (res) {

      setState(() {
        //conversão dos documentos em uma Lista Dinânica
        //a versão mais recente da coleção de documentos será mapeada na Lista Dinâmica
        ordensDeServicos = res.docs.map((e) => OrdemDeServico.fromMap(e.data(), e.id)).toList();
      });

    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ordens de Serviços Geradas",),
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

        stream: db.collection("ordens de servico").snapshots(),
        builder: (context,snapshot){

          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(child: Text("Erro ao conectar no Firebase"));
            case ConnectionState.waiting:  
              return Center(child: CircularProgressIndicator());
            default: return ListView.builder(
                itemCount: ordensDeServicos.length,
                itemBuilder: (context,index){

                  return ListTile(

                    title: Text("OS - "+ordensDeServicos[index].numeroOS, style: TextStyle(fontSize: 24)),
                    subtitle: Text("CLIENTE:   "+ordensDeServicos[index].nomeCliente, style: TextStyle(fontSize: 15)),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: (){
                        //Apagar o documento selecionado
                        db.collection("ordens de servico").doc(ordensDeServicos[index].id).delete();
                      },
                    ),

                    onTap: (){
                      //Abrir a tela de Cadastro passando o ID
                      //do documento como parâmetro  
                      Navigator.pushNamed(
                        context, '/ordemServico',
                        arguments: ordensDeServicos[index].id
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
          Navigator.pushNamed(context, '/ordemServico', arguments: null);
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