class Company {
  final int codEmpresa;
  final String nomEmpresa;
  final String nomEmpresaAux;

  Company({
    required this.codEmpresa,
    required this.nomEmpresa,
    required this.nomEmpresaAux,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      codEmpresa: json['codEmpresa'],
      nomEmpresa: json['nomEmpresa'],
      nomEmpresaAux: json['nomEmpresaAux'],
    );
  }

  static List<Company> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Company.fromJson(json)).toList();
  }
}
