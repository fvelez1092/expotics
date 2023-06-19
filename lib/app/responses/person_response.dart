import 'package:expotics/app/models/person_model.dart';

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
