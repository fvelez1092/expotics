import 'dart:async';
import 'package:dio/dio.dart';
import 'package:expotics/app/responses/person_response.dart';
import 'package:expotics/app/responses/person_response_error.dart';

class AuthenticationService {
  //final storage = FlutterSecureStorage();

  static final Dio _dio = Dio();

  static Future<PersonResponse> getPerson(String cedula) async {
    try {
      var response =
          await _dio.post('https://expotecnologia.manabi.gob.ec/api/getPerson',
              //'http://172.20.120.3:3000/api/getPerson',
              data: {
                "cedula": cedula,
              },
              options: Options(
                headers: {
                  'Content-Type': 'application/json',
                  'Accept': 'application/json',
                },
              ));

      PersonResponse personResponse = PersonResponse.fromJson(response.data);
      return personResponse;
    } on DioError catch (e, s) {
      if (e.response!.statusCode == 500) {
        PersonResponseError response =
            PersonResponseError.fromJson(e.response!.data);
        throw Exception("$response");
      }
    } catch (e) {
      throw Exception("Error ggg : $e");
    }

    throw Exception("Cedula incorrecta");
  }

  static Future<PersonResponse> createPerson(Person persona) async {
    try {
      var response = await _dio.post(
          'https://expotecnologia.manabi.gob.ec/api/createPerson',
          //'http://172.20.120.3:3000/api/createPerson',
          data: {
            "cedula": persona.cedula,
            "name": persona.name,
            "home": persona.home,
            "age": persona.age,
            "email": persona.correo,
            "institution": persona.institucion,
            "position": persona.cargo,
            "cellphone": persona.cellphone
          },
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ));

      PersonResponse personResponse = PersonResponse.fromJson(response.data);
      return personResponse;
    } on DioError catch (e, s) {
      if (e.response!.statusCode == 500) {
        PersonResponseError response =
            PersonResponseError.fromJson(e.response!.data);
        throw Exception("$response");
      }
    } catch (e) {
      throw Exception("Error ggg : " + e.toString());
    }
    print("Debug");
    throw Exception("Cedula incorrecta");
  }
}
