class Person {
  String _cedula = '';
  String _names = '';
  String _residencia = '';
  String _correo = '';
  String _edad = '';
  String _institucion = '';
  String _cargo = '';

  Person({cedula, names, residencia, correo, edad, institucion, cargo}) {
    _cedula = cedula;
    _names = names;
    _residencia = residencia;
    _correo = correo;
    _edad = edad;
    _institucion = institucion;
    _cargo = cargo;
  }

  String get cedula => _cedula;
  set cedula(String value) => _cedula = value;
  String get names => _names;
  set names(String value) => _names = value;
  String get residencia => _residencia;
  set residencia(String value) => _residencia = value;
  String get correo => _correo;
  set correo(String value) => _correo = value;
  String get edad => _edad;
  set edad(String value) => _edad = value;
  String get institucion => _institucion;
  set institucion(String value) => _institucion = value;
  String get cargo => _cargo;
  set cargo(String value) => _cargo = value;

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      cedula: json['cedula'],
      names: json['names'],
      residencia: json['residencia'],
      correo: json['correo'],
      edad: json['edad'].toString(),
      institucion: json['institucion'],
      cargo: json['cargo'],
    );
  }
}
