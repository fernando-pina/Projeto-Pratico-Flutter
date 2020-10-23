//
// TELA DE ABERTURA DE ORDEM DE SERVIÇOS
//
import 'package:flutter/material.dart';

class OrdemServico extends StatefulWidget {
  @override
  _OrdemServicoState createState() => _OrdemServicoState();
}

class _OrdemServicoState extends State<OrdemServico> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  TextEditingController txtOS = TextEditingController();
  TextEditingController txtNomeDoConcessionario = TextEditingController();
  TextEditingController txtNomeCliente = TextEditingController();
  TextEditingController txtTelefoneCliente = TextEditingController();
  TextEditingController txtEnderecoCliente = TextEditingController();
  TextEditingController txtCidadeCliente = TextEditingController();
  TextEditingController txtEstadoCliente = TextEditingController();
  TextEditingController txtCEPCliente = TextEditingController();
  TextEditingController txtMarcaDaMaquina = TextEditingController();
  TextEditingController txtNumeroSerie = TextEditingController();
  TextEditingController txtOcorrencia = TextEditingController();
  TextEditingController txtCausasProvaveis = TextEditingController();
  TextEditingController txtAcaoTomada = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Abertura de Ordem de Serviços")),
      body:SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.description, size: 80),
                  Text("Ordem de Serviço", style: TextStyle(fontSize: 30)),
                ],
              ),
              campoTexto("OS de Número", txtOS),
              SizedBox(height: 50),
              Text("DADOS DO SERVEIÇO TÉCNICO AUTORIZADO", style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
              campoTexto("Nome do Concessionário", txtNomeDoConcessionario),
              SizedBox(height: 50),
              Text("DADOS DO CLIENTE", style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
              campoTexto("Nome", txtNomeCliente),
              campoTexto("Telefone", txtTelefoneCliente),
              campoTexto("Endereco", txtEnderecoCliente),
              campoTexto("Cidade", txtCidadeCliente),
              campoTexto("Estado", txtEstadoCliente),
              campoTexto("CEP", txtCEPCliente),
              SizedBox(height: 50),
              Text("IDENTIFICAÇÃO DO EQUIPAMENTO", style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
              campoTexto("Marca da Máquina", txtMarcaDaMaquina),
              campoTexto("Número de Série", txtNumeroSerie),
              SizedBox(height: 50),
              Text("REGISTRO DA SOLICITAÇÃO", style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
              campoTexto("Ocorrência", txtOcorrencia),
              SizedBox(height: 50),
              Text("FALHAS OU OBSERVAÇÕES", style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
              campoTexto("Causas Prováveis", txtCausasProvaveis),
              campoTexto("Ação Tomada", txtAcaoTomada),
            ]
          ),
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


campoTexto(rotulo, controle){
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: TextFormField(
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 20),
      decoration: InputDecoration(
        labelText: rotulo,
        labelStyle: TextStyle(fontSize: 12),
      ),
      controller: controle,
      validator: (value){
        return (value.isEmpty) ? "É obrigatório o preenchimento de todos os campos." : null;
      },
    ),
  );
}


