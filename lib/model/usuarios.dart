class Usuario{

  String id;
  String email;
  String senha;

  //Construtor para receber as informações
  Usuario(this.id,this.email,this.senha);

  //Converter um DOCUMENTO em um OBJETO
  Usuario.fromMap(Map<String,dynamic>map, String id){

    //Se o parâmetro id != null, então this.id = id,
    //Senão, this.id = '';
    this.id = id ?? '';
    this.email = map['email'];
    this.senha = map['senha'];

  }
}