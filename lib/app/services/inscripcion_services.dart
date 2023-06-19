import 'dart:async';
import 'package:dio/dio.dart';
import 'package:expotics/app/models/person_model.dart';
import 'package:expotics/app/responses/assistants_response.dart';
import 'package:expotics/app/responses/person_response.dart';
import 'package:expotics/app/responses/person_response_error.dart';

class InscripcionService {
  //final storage = FlutterSecureStorage();

  static final Dio _dio = Dio();

  static Future<PersonResponse> getPerson(String cedula) async {
    try {
      var response = await _dio.post(
          'https://expotecnologia.manabi.gob.ec/api/getPreinscripcion',
          //'http://172.20.120.3:3000/api/getPreinscripcion',
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
      throw Exception("Error ggg : " + e.toString());
    }

    throw Exception("Error en la Peticion");
  }

  static Future<PersonResponse> createPerson(Person persona) async {
    try {
      var response = await _dio.post(
          'https://expotecnologia.manabi.gob.ec/api/updatePerson',
          //  'http://172.20.120.3:3000/api/updatePerson',
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
    throw Exception("Error en la Peticion");
  }

  static Future<AssistantsResponse> getAssistants() async {
    try {
      var response = await _dio.get(
          'https://expotecnologia.manabi.gob.ec/api/getAssistants',
          //'http://172.20.120.3:3000/api/getPreinscripcion',
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ));

      AssistantsResponse assitantsResponse =
          AssistantsResponse.fromJson(response.data);
      return assitantsResponse;
    } on DioError catch (e, s) {
      if (e.response!.statusCode == 500) {
        PersonResponseError response =
            PersonResponseError.fromJson(e.response!.data);
        throw Exception("$response");
      }
    } catch (e) {
      throw Exception("Error ggg : " + e.toString());
    }

    throw Exception("Error en la Peticion");
  }
}
