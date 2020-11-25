class Cliente{

  String id;
  String cep;
  String cidade;
  String emailContato;
  String endereco;
  String estado;
  String marcaDaMaquina;
  String nome;
  String nomeContato;
  String numeroSerie;
  String telefoneContato;

  //Construtor para receber as informações
  Cliente(this.id,this.cep,this.cidade,this.emailContato,this.endereco,this.estado,this.marcaDaMaquina,this.nome,this.nomeContato,this.numeroSerie,this.telefoneContato);

  //Converter um DOCUMENTO em um OBJETO
  Cliente.fromMap(Map<String,dynamic>map, String id){

    //Se o parâmetro id != null, então this.id = id,
    //Senão, this.id = '';
    this.id = id ?? '';
    this.cep = map['cep'];
    this.cidade = map['cidade'];
    this.emailContato = map['email_contato'];
    this.endereco = map['endereco'];
    this.estado = map['estado'];
    this.marcaDaMaquina = map['marca_da_maquina'];
    this.nome = map['nome'];
    this.nomeContato = map['nome_contato'];
    this.numeroSerie = map['numero_serie'];
    this.telefoneContato = map['telefone'];

  }
}