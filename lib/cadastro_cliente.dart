//
// TELA DE CADASTRO DE CLIENTES
//
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CadastroClientes extends StatefulWidget {
  @override
  _CadastroClientesState createState() => _CadastroClientesState();
}

class _CadastroClientesState extends State<CadastroClientes> {

  var db = FirebaseFirestore.instance;
  
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  TextEditingController txtNome = TextEditingController();
  TextEditingController txtCidade = TextEditingController();
  TextEditingController txtEstado = TextEditingController();
  TextEditingController txtMarcaDaMaquina = TextEditingController();
  TextEditingController txtNumeroSerie = TextEditingController();
  TextEditingController txtTelefoneContato = TextEditingController();
  TextEditingController txtEmailContato = TextEditingController();
  TextEditingController txtNomeContato = TextEditingController();

  //Recuperar um DOCUMENTO  a partir do ID
  void getDocumentById(String id) async{
    await db.collection("clientes").doc(id).get()
      .then((doc){

        txtNome.text = doc.data()['nome'];
        txtCidade.text = doc.data()['cidade'];
        txtEstado.text = doc.data()['estado'];
        txtMarcaDaMaquina.text = doc.data()['marca_da_maquina'];
        txtNumeroSerie.text = doc.data()['numero_serie'];
        txtNomeContato.text = doc.data()['nome_contato'];
        txtEmailContato.text = doc.data()['email_contato'];
        txtTelefoneContato.text = doc.data()['telefone_contato'];

    });
  }
  
  @override
  Widget build(BuildContext context) {

    final String id = ModalRoute.of(context).settings.arguments;

    //Como a tela de cadastro será utilizada em dois contexto
    //contexto 1: quando o botão '+' de adicionar, da 'tela principal', for acionado
    //a 'tela de cadastro' será aberta para que o cadastro seja realizado
    //contexto 2: quando algum dos itens da lista for selecionado, a 'tela de cadastro'
    //será aberta para que a edição seja realizada.
    if ( id != null ){
      if (txtNome.text == '' && txtCidade.text == '' && txtEstado.text == '' && txtMarcaDaMaquina.text == '' && txtNumeroSerie.text == '' && txtNomeContato.text == '' && txtEmailContato.text == '' && txtTelefoneContato.text == ''){
        getDocumentById(id);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de Clientes"),
        actions: [
          IconButton(
            icon: Icon(Icons.home_outlined),
            onPressed: (){
              Navigator.pushNamed(context, '/menu');
            },
          )
        ],
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
                  Icon(Icons.people, size: 40),
                  Text("Clientes", style: TextStyle(fontSize: 25)),
                ],
              ),
              campoTexto("Nome", txtNome),
              campoTexto("Cidade", txtCidade),
              campoTexto("Estado", txtEstado),
              campoTexto("Marca da Máquina", txtMarcaDaMaquina),
              campoTexto("Número de Série", txtNumeroSerie),
              campoTexto("Nome do Contato", txtNomeContato),
              campoTexto("Email do Contato", txtEmailContato),
              campoTexto("Telefone do Contato", txtTelefoneContato),
              //Botão
              Container(
                padding: const EdgeInsets.only(top: 20),
                child: RaisedButton(
                  child: Text("Cadastrar"),
                  onPressed: () async{

                    if (id == null){
                        //ADICIONAR um novo DOCUMENTO a COLEÇÃO
                        await db.collection("clientes").add(
                          {
                            "nome" : txtNome.text,
                            "cidade" : txtCidade.text,
                            "estado" : txtEstado.text,
                            "marca_da_maquina" : txtMarcaDaMaquina.text,
                            "numero_serie" : txtNumeroSerie.text,
                            "nome_contato" : txtNomeContato.text,
                            "email_contato" : txtEmailContato.text,
                            "telefone_contato" : txtTelefoneContato.text
                          }
                        );
                    }else{
                        //ATUALIZAR dados do DOCUMENTO
                        await db.collection("clientes").doc(id).update(
                          {
                            "nome" : txtNome.text,
                            "cidade" : txtCidade.text,
                            "estado" : txtEstado.text,
                            "marca_da_maquina" : txtMarcaDaMaquina.text,
                            "numero_serie" : txtNumeroSerie.text,
                            "nome_contato" : txtNomeContato.text,
                            "email_contato" : txtEmailContato.text,
                            "telefone_contato" : txtTelefoneContato.text
                          }
                        );
                    }

                    showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: Text(''),
                          content: Text('Cadastro realizado com sucesso!'),
                          actions: <Widget>[
                            TextButton(child: Text('Ok'), onPressed: () {
                              Navigator.pop(context);

                              txtNome.text = "";
                              txtCidade.text = "";
                              txtEstado.text = "";
                              txtMarcaDaMaquina.text = "";
                              txtNumeroSerie.text = "";
                              txtNomeContato.text = "";
                              txtEmailContato.text = "";
                              txtTelefoneContato.text = "";

                            }),
                          ],
                        );
                      }
                    );
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