//
// TELA DE ABERTURA DE ORDEM DE SERVIÇOS
//
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrdemServico extends StatefulWidget {
  @override
  _OrdemServicoState createState() => _OrdemServicoState();
}

class _OrdemServicoState extends State<OrdemServico> {

  var db = FirebaseFirestore.instance;
  
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  TextEditingController txtOS = TextEditingController();
  TextEditingController txtNomeDoConcessionario = TextEditingController();
  TextEditingController txtNomeCliente = TextEditingController();
  TextEditingController txtTelefoneCliente = TextEditingController();
  TextEditingController txtCidadeCliente = TextEditingController();
  TextEditingController txtEstadoCliente = TextEditingController();
  TextEditingController txtMarcaDaMaquina = TextEditingController();
  TextEditingController txtNumeroSerie = TextEditingController();
  TextEditingController txtOcorrencia = TextEditingController();
  TextEditingController txtCausasProvaveis = TextEditingController();
  TextEditingController txtAcaoTomada = TextEditingController();

  //Recuperar um DOCUMENTO  a partir do ID
  void getDocumentById(String id) async{
    await db.collection("ordens de servico").doc(id).get()
      .then((doc){

        txtOS.text = doc.data()['os_de_numero'];
        txtNomeDoConcessionario.text = doc.data()['nome_concessionario'];
        txtNomeCliente.text = doc.data()['nome_cliente'];
        txtTelefoneCliente.text = doc.data()['telefone_cliente_contato'];
        txtCidadeCliente.text = doc.data()['cidade_cliente'];
        txtEstadoCliente.text = doc.data()['estado_cliente'];
        txtMarcaDaMaquina.text = doc.data()['marca_da_maquina'];
        txtNumeroSerie.text = doc.data()['numero_serie'];
        txtOcorrencia.text = doc.data()['ocorrencia'];
        txtCausasProvaveis.text = doc.data()['causas_provaveis'];
        txtAcaoTomada.text = doc.data()['acao_tomada'];

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
      if (txtOS.text == '' && txtNomeDoConcessionario.text == '' && txtNomeCliente.text == '' && txtTelefoneCliente.text == '' && txtCidadeCliente.text == '' && txtEstadoCliente.text == '' && txtMarcaDaMaquina.text == '' && txtNumeroSerie.text == '' && txtOcorrencia.text == '' && txtCausasProvaveis.text == '' && txtAcaoTomada.text == ''){
        getDocumentById(id);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Abertura de OS"),
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
                  Icon(Icons.description, size: 40),
                  Text("Ordem de Serviço", style: TextStyle(fontSize: 25)),
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
              campoTexto("Cidade", txtCidadeCliente),
              campoTexto("Estado", txtEstadoCliente),
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
              //Botão
              Container(
                padding: const EdgeInsets.only(top: 20),
                child: RaisedButton(
                  child: Text("Abrir / Salvar"),
                  onPressed: () async{

                    if (id == null){
                        //ADICIONAR um novo DOCUMENTO a COLEÇÃO
                        await db.collection("ordens de servico").add(
                          {
                            "os_de_numero" : txtOS.text,
                            "nome_concessionario" : txtNomeDoConcessionario.text,
                            "nome_cliente" : txtNomeCliente.text,
                            "telefone_cliente_contato" : txtTelefoneCliente.text,
                            "cidade_cliente" : txtCidadeCliente.text,
                            "estado_cliente" : txtEstadoCliente.text,
                            "marca_da_maquina" : txtMarcaDaMaquina.text,
                            "numero_serie" : txtNumeroSerie.text,
                            "ocorrencia" : txtOcorrencia.text,
                            "causas_provaveis" : txtCausasProvaveis.text,
                            "acao_tomada" : txtAcaoTomada.text
                          }
                        );
                    }else{
                        //ATUALIZAR dados do DOCUMENTO
                        await db.collection("ordens de servico").doc(id).update(
                          {
                            "os_de_numero" : txtOS.text,
                            "nome_concessionario" : txtNomeDoConcessionario.text,
                            "nome_cliente" : txtNomeCliente.text,
                            "telefone_cliente_contato" : txtTelefoneCliente.text,
                            "cidade_cliente" : txtCidadeCliente.text,
                            "estado_cliente" : txtEstadoCliente.text,
                            "marca_da_maquina" : txtMarcaDaMaquina.text,
                            "numero_serie" : txtNumeroSerie.text,
                            "ocorrencia" : txtOcorrencia.text,
                            "causas_provaveis" : txtCausasProvaveis.text,
                            "acao_tomada" : txtAcaoTomada.text
                          }
                        );
                        Navigator.pushNamed(context, '/listaOrdensServicos');
                    }

                    showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: Text(''),
                          content: Text('Ordem de Serviço aberta com sucesso!'),
                          actions: <Widget>[
                            TextButton(child: Text('Ok'), onPressed: () {
                              Navigator.pop(context);

                              txtOS.text = "";
                              txtNomeDoConcessionario.text = "";
                              txtNomeCliente.text = "";
                              txtTelefoneCliente.text = "";
                              txtCidadeCliente.text = "";
                              txtEstadoCliente.text = "";
                              txtMarcaDaMaquina.text = "";
                              txtNumeroSerie.text = "";
                              txtOcorrencia.text = "";
                              txtCausasProvaveis.text = "";
                              txtAcaoTomada.text = "";

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


