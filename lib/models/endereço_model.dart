class EnderecoModel {
  String? cep;
  String? logradouro;
  String? complemento;
  String? bairro;
  String? localidade;
  String? uf;
  String? ibge;
  String? gia;
  String? ddd;
  String? siafi;

  EnderecoModel({
    this.cep,
    this.logradouro,
    this.complemento,
    this.bairro,
    this.localidade,
    this.uf,
    this.ibge,
    this.gia,
    this.ddd,
    this.siafi,
  });

  EnderecoModel.fromJson(Map<String, dynamic> json) {
    cep = json["cep"];
    logradouro = json["logradouro"];
    complemento = json["complemento"];
    bairro = json["bairro"];
    localidade = json["localidade"];
    uf = json["uf"];
    ibge = json["ibge"];
    gia = json["gia"];
    ddd = json["add"];
    siafi = json["siafi"];
  }
}
