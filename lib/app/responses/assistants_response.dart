import 'package:expotics/app/models/person_model.dart';

class AssistantsResponse {
  bool ok;
  List<Person> assistants;

  AssistantsResponse({required this.ok, required this.assistants});

  factory AssistantsResponse.fromJson(Map<String, dynamic> json) {
    return AssistantsResponse(
      ok: json['ok'],
      assistants:
          List<Person>.from(json["data"].map((x) => Person.fromJson(x))),
    );
  }
  // @override
  // String toString() {
  //   return "person[ id=${person.id}, cedula=${person.cedula}, name=${person.name}, home=${person.home},cellphone=${person.cellphone},age=${person.age},correo=${person.correo},institution=${person.institucion},cargo=${person.cargo}]";
  // }
}
