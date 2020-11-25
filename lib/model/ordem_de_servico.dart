class OrdemDeServico{

  String id;
  String causasProvaveis;
  String cepCliente;
  String cidadeCliente;
  String enderecoCliente;
  String estadoCliente;
  String marcaDaMaquina;
  String nomeCliente;
  String nomeClienteContato;
  String nomeConcessionario;
  String numeroSerie;
  String ocorrencia;
  String numeroOS;
  String telefoneClienteContato;

  //Construtor para receber as informações
  OrdemDeServico(this.id,this.causasProvaveis,this.cepCliente,this.cidadeCliente,this.enderecoCliente,this.estadoCliente,this.marcaDaMaquina,this.nomeCliente,this.nomeClienteContato,this.nomeConcessionario,this.numeroSerie,this.ocorrencia,this.numeroOS,this.telefoneClienteContato);

  //Converter um DOCUMENTO em um OBJETO
  OrdemDeServico.fromMap(Map<String,dynamic>map, String id){

    //Se o parâmetro id != null, então this.id = id,
    //Senão, this.id = '';
    this.id = id ?? '';
    this.causasProvaveis = map['causas_provaveis'];
    this.cepCliente = map['cep_cliente'];
    this.cidadeCliente = map['cidade_cliente'];
    this.enderecoCliente = map['endereco_cliente'];
    this.estadoCliente = map['estado_cliente'];
    this.marcaDaMaquina = map['marca_da_maquina'];
    this.nomeCliente = map['nome_cliente'];
    this.nomeClienteContato = map['nome_cliente_contato'];
    this.nomeConcessionario = map['nome_concessionario'];
    this.numeroSerie = map['numero_serie'];
    this.ocorrencia = map['ocorrencia'];
    this.numeroOS = map['os_de_numero'];
    this.telefoneClienteContato = map['telefone_cliente_contato'];

  }
}