class PersonResponse {
  bool ok;
  Person person;

  PersonResponse({required this.ok, required this.person});

  factory PersonResponse.fromJson(Map<String, dynamic> json) {
    return PersonResponse(
      ok: json['ok'],
      person: Person.fromJson(json['data']),
    );
  }
  @override
  String toString() {
    return "person[ id=${person.id}, cedula=${person.cedula}, name=${person.name}, home=${person.home},cellphone=${person.cellphone},age=${person.age},correo=${person.correo},institution=${person.institucion},cargo=${person.cargo}]";
  }
}

class Person {
  int? id;
  String cedula;
  String name;
  String home;
  int age;
  String? correo;
  String? institucion;
  String? cargo;
  String? cellphone;
  Person(
      {required this.id,
      required this.cedula,
      required this.name,
      required this.home,
      required this.age,
      this.cellphone,
      this.correo = "",
      this.institucion = "",
      this.cargo = ""});

  factory Person.fromJson(Map<String, dynamic> json) {
    Person usuario = Person(
        id: json['id'],
        cedula: json['cedula'],
        name: json['name'],
        home: json['home'],
        age: json['age'],
        correo: json['email'] != null ? json['email'] : "",
        institucion: json['institution'] != null ? json['institution'] : "",
        cargo: json['position'] != null ? json['position'] : "");
    return usuario;
  }
}
