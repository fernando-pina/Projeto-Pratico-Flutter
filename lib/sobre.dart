//
// TELA DE INFORMAÇÕES SOBRE O APLICATIVO
//
import 'package:flutter/material.dart';

class Sobre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sobre"),
        actions: [
          IconButton(
            icon: Icon(Icons.home_outlined),
            onPressed: (){
              Navigator.pushNamed(context, '/menu');
            },
          )
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(35.0),
        child: ListView(children: <Widget>[
            Text("Sistema Especialista em Manutenção",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50),
            Text.rich(
              TextSpan(
                children:
                <TextSpan>[
                  TextSpan(text: "O serviço de manutenção exige mão-de-obra altamente especializada. O sucesso do serviço muitas vezes depende do nível de conhecimento que o técnico de campo possui sobre o assunto. Quanto mais conhecimento ele possuir mais eficiente ele será e consequentemente menor será o custo do serviço prestado, aumentando dessa maneira a competitividade da empresa prestadora do serviço.",),
                ],
              ),
            ),
            SizedBox(height: 15),
            Text.rich(
              TextSpan(
                children:
                <TextSpan>[
                  TextSpan(text: "Este aplicativo foi projetado e desenvolvido para ajudar as empresas de prestação de serviços em manutenção a serem mais acertivas na resolução dos problemas dos seus clientes.",),
                ],
              ),
            ),
            SizedBox(height: 15),
            Text.rich(
              TextSpan(
                children:
                <TextSpan>[
                  TextSpan(text: "Este software reuni conhecimentos especializados, adiquiridos ao longo do tempo, sobre um determinado assunto, que auxiliará os técnicos de campo em suas atividades cotidianas no atendimento a assistência técnica de máquina.",),
                ],
              ),
            ),
            SizedBox(height: 30),
            Text("Autor",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            Container(
              child: Image.asset("assets/imagens/autor_do_app.jpg")
            ),
            SizedBox(height: 15),
            Text.rich(
              TextSpan(
                children:
                <TextSpan>[
                  TextSpan(text: "Nome: ", style: TextStyle(fontWeight: FontWeight.bold),),
                  TextSpan(text: "Fernando de Oliveira Pina", style: TextStyle(fontStyle: FontStyle.italic),),
                ],
              ),
            ),
            SizedBox(height: 5),
            Text.rich(
              TextSpan(
                children:
                <TextSpan>[
                  TextSpan(text: "Idade: ", style: TextStyle(fontWeight: FontWeight.bold),),
                  TextSpan(text: "36 anos", style: TextStyle(fontStyle: FontStyle.italic),),
                  ],
              ),
            ),
          ],
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