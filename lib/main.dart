// import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sistema_especialista_flutter/base_dados_clientes.dart';
import 'package:sistema_especialista_flutter/base_dados_ordem_servico.dart';
import 'package:sistema_especialista_flutter/cadastro_cliente.dart';
import 'package:sistema_especialista_flutter/menu.dart';
import 'package:sistema_especialista_flutter/ordem_servico.dart';
import 'package:sistema_especialista_flutter/sobre.dart';
import 'package:sistema_especialista_flutter/tela_login.dart';

void main() async{

  //Registrar o Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: Colors.yellow),
    title: 'Sistema Especialista em Manutenção',
    initialRoute: '/login',
    routes: {
      '/login': (context) => TelaLogin(),
      '/menu': (context) => MenuIniciar(),
      '/cadastroClientes': (context) => CadastroClientes(),
      '/listaClientes': (context) => BaseClientes(),
      '/ordemServico': (context) => OrdemServico(),
      '/listaOrdensServicos': (context) => BaseOrdensServicos(),
      '/sobre': (context) => Sobre(),
    },
  ));
}