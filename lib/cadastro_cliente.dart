//
// TELA DE CADASTRO DE CLIENTES
//
import 'package:flutter/material.dart';

class CadastroClientes extends StatefulWidget {
  @override
  _CadastroClientesState createState() => _CadastroClientesState();
}

class _CadastroClientesState extends State<CadastroClientes> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  TextEditingController txtNome = TextEditingController();
  TextEditingController txtTelefone = TextEditingController();
  TextEditingController txtEndereco = TextEditingController();
  TextEditingController txtCidade = TextEditingController();
  TextEditingController txtEstado = TextEditingController();
  TextEditingController txtCEP = TextEditingController();
  TextEditingController txtMarcaDaMaquina = TextEditingController();
  TextEditingController txtNumeroSerie = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de Clientes")
      ),
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
                  Icon(Icons.people, size: 80),
                  Text("Clientes", style: TextStyle(fontSize: 30)),
                ],
              ),
              campoTexto("Nome", txtNome),
              campoTexto("Telefone", txtTelefone),
              campoTexto("Endereco", txtEndereco),
              campoTexto("Cidade", txtCidade),
              campoTexto("Estado", txtEstado),
              campoTexto("CEP", txtCEP),
              campoTexto("Marca da Máquina", txtMarcaDaMaquina),
              campoTexto("Número de Série", txtNumeroSerie),
              //Botão
              Container(
                padding: const EdgeInsets.only(top: 20),
                child: RaisedButton(
                  child: Text("Cadastrar"),
                  onPressed: () {
                    if(_formkey.currentState.validate()){

                      setState((){
                        txtNome.text = "";
                        txtTelefone.text = "";
                        txtEndereco.text = "";
                        txtCidade.text = "";
                        txtEstado.text = "";
                        txtCEP.text = "";
                        txtMarcaDaMaquina.text = "";
                        txtNumeroSerie.text = "";
                      });

                      showDialog(
                        context: context,
                        builder: (BuildContext context){
                          return AlertDialog(
                            title: Text(''),
                            content: Text('Cadastrado com sucesso!'),
                            actions: <Widget>[
                              TextButton(child: Text('Ok'), onPressed: () {
                                //Navigator.of(context).pop();
                              }),
                            ],
                          );
                        }
                      );

                      //_cadastrar();

                      //_reset();

                    }
                  }
                )
              ),
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


// botaoCadastrar(BuildContext context){
//   return Container(
//     padding: const EdgeInsets.only(top: 20),
//     child: RaisedButton(
//       child: Text("Cadastrar"),
//       onPressed: () {
//         if(_formkey.currentState.validate()){
                  
//           //_cadastrar();

//           _reset();

//         }
//       }
//     )
//   );
// }


// void _reset(){
//   setState((){
//     txtOS.text = "";
//     txtNomeDoConcessionario.text = "";
//     txtNomeCliente.text = "";
//     txtTelefoneCliente.text = "";
//     txtEnderecoCliente.text = "";
//     txtCidadeCliente.text = "";
//     txtEstadoCliente.text = "";
//     txtCEPCliente.text = "";
//     txtMarcaDaMaquina.text = "";
//     txtNumeroSerie.text = "";
//     txtOcorrencia.text = "";
//     txtCausasProvaveis.text = "";
//     txtAcaoTomada.text = "";
//   });
// }