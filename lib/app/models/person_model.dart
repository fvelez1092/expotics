class Person {
  int? id;
  bool attendance;
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
      this.attendance = false,
      this.cellphone = "",
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
        cellphone: json['cellphone'] ?? "",
        correo: json['email'] ?? "",
        institucion: json['institution'] ?? "",
        cargo: json['position'] ?? "",
        attendance: json['attendance'] ?? false);
    return usuario;
  }
}
