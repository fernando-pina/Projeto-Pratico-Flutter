//
// TELA DE BASE DE DADOS DOS CLIENTES
//
import 'package:flutter/material.dart';

class BaseClientes extends StatefulWidget {
  @override
  _BaseClientesState createState() => _BaseClientesState();
}

class _BaseClientesState extends State<BaseClientes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clientes Cadastrados",)
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
             ListTile(
              leading: Icon(Icons.double_arrow),    
              title: Text('USINA SÃO MARTINHO'),
              subtitle: Text('Fone: 9999-9999 / contato@saomarinho.com.br / Contato: Sandro'),
            ),
            SizedBox(height: 30),
            ListTile(
              leading: Icon(Icons.double_arrow),    
              title: Text('USINA SÃO JOÃO DA BOA VISTA'),
              subtitle: Text('Fone: 9999-9999 / contato@saojboavista.com.br / Contato: Marcia'),
            ),
            SizedBox(height: 30),
            ListTile(
              leading: Icon(Icons.double_arrow),    
              title: Text('USINA SÃO LUIZ'),
              subtitle: Text('Fone: 9999-9999 / contato@saoluiz.com.br / Contato: Cardoso'),
            ),
            SizedBox(height: 30),
            ListTile(
              leading: Icon(Icons.double_arrow),    
              title: Text('USINA VISTA ALEGRE'),
              subtitle: Text('Fone: 9999-9999 / contato@vistaalegre.com.br / Contato: Glaucia'),
            ),
            SizedBox(height: 30),
            ListTile(
              leading: Icon(Icons.double_arrow),    
              title: Text('USINA ATENA'),
              subtitle: Text('Fone: 9999-9999 / contato@atena.com.br / Contato: Sandoval'),
            ),
            SizedBox(height: 30),
            ListTile(
              leading: Icon(Icons.double_arrow),    
              title: Text('USINA ALCÍDIA'),
              subtitle: Text('Fone: 9999-9999 / contato@alcidia.com.br / Contato: Manoel'),
            ),
            SizedBox(height: 30),
            ListTile(
              leading: Icon(Icons.double_arrow),    
              title: Text('USINA ESTER'),
              subtitle: Text('Fone: 9999-9999 / contato@ester.com.br / Contato: Tadeu'),
            ),
            SizedBox(height: 30),
            ListTile(
              leading: Icon(Icons.double_arrow),    
              title: Text('USINA SÃO MANOEL'),
              subtitle: Text('Fone: 9999-9999 / contato@saomanoel.com.br / Contato: Gisele'),
            ),
            SizedBox(height: 30),
            ListTile(
              leading: Icon(Icons.double_arrow),    
              title: Text('USINA CONQUISTA DO PONTAL'),
              subtitle: Text('Fone: 9999-9999 / contato@conqdopontal.com.br / Contato: Moura'),
            ),
            SizedBox(height: 30),
            ListTile(
              leading: Icon(Icons.double_arrow),    
              title: Text('USINA TABOÃO'),
              subtitle: Text('Fone: 9999-9999 / contato@taboao.com.br / Contato: Tamara'),
            ),
            SizedBox(height: 30),
            ListTile(
              leading: Icon(Icons.double_arrow),    
              title: Text('USINA BAZAN'),
              subtitle: Text('Fone: 9999-9999 / contato@bazan.com.br / Contato: Cláudia'),
            ),
            SizedBox(height: 30),
            ListTile(
              leading: Icon(Icons.double_arrow),    
              title: Text('USINA BELA VISTA'),
              subtitle: Text('Fone: 9999-9999 / contato@belavista.com.br / Contato: João'),
            ),
            SizedBox(height: 30),
            ListTile(
              leading: Icon(Icons.double_arrow),    
              title: Text('USINA BIOENERGIA DO BRASIL'),
              subtitle: Text('Fone: 9999-9999 / contato@bioenergiabr.com.br / Contato: Joaquim'),
            ),
            SizedBox(height: 30),
            ListTile(
              leading: Icon(Icons.double_arrow),    
              title: Text('USINA CONTINENTAL'),
              subtitle: Text('Fone: 9999-9999 / contato@continental.com.br / Contato: Cláudio'),
            ),
            SizedBox(height: 30),
            ListTile(
              leading: Icon(Icons.double_arrow),    
              title: Text('USINA JARDEST'),
              subtitle: Text('Fone: 9999-9999 / contato@jardest.com.br / Contato: Sidiney'),
            ),
            SizedBox(height: 30),
            ListTile(
              leading: Icon(Icons.double_arrow),    
              title: Text('USINA LEME'),
              subtitle: Text('Fone: 9999-9999 / contato@leme.com.br / Contato: Fernando'),
            ),
            SizedBox(height: 30),
            ListTile(
              leading: Icon(Icons.double_arrow),    
              title: Text('USINA SANTA ELISA'),
              subtitle: Text('Fone: 9999-9999 / contato@santaelisa.com.br / Contato: Cristiane'),
            ),
            SizedBox(height: 30),
            ListTile(
              leading: Icon(Icons.double_arrow),    
              title: Text('USINA VALE DO ROSÁRIO'),
              subtitle: Text('Fone: 9999-9999 / contato@valedorosario.com.br / Contato: Edson'),
            ),
            SizedBox(height: 30),
            ListTile(
              leading: Icon(Icons.double_arrow),    
              title: Text('USINA MOEMA'),
              subtitle: Text('Fone: 9999-9999 / contato@moema.com.br / Contato: Eraldo'),
            ),
            SizedBox(height: 30),
            ListTile(
              leading: Icon(Icons.double_arrow),    
              title: Text('USINA OUROESTE'),
              subtitle: Text('Fone: 9999-9999 / contato@ouroeste.com.br / Contato: Mauro'),
            ),
          ],
        ),
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