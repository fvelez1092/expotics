// ignore_for_file: unrelated_type_equality_checks

import 'dart:math';

import 'package:expotics/app/models/person_model.dart';
import 'package:expotics/app/responses/assistants_response.dart';
import 'package:expotics/app/responses/person_response.dart';
import 'package:expotics/app/services/inscripcion_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InscripcionesController extends GetxController {
  RxInt ganador = 0.obs;
  RxInt totalAsistentes = 0.obs;
  RxBool isPreinscripcion = true.obs;
  RxBool errorEmail = false.obs;
  late Person person;
  final error = ''.obs;
  late PersonResponse personResponse;
  TextEditingController ctrlCedula = TextEditingController();
  TextEditingController ctrlNombres = TextEditingController();
  TextEditingController ctrlresidencia = TextEditingController();
  TextEditingController ctrlEdad = TextEditingController();
  TextEditingController ctrlCorreo = TextEditingController();
  TextEditingController ctrlInstitucion = TextEditingController();
  TextEditingController ctrlCargo = TextEditingController();
  TextEditingController ctrlCellPhone = TextEditingController();

  RxBool ifperson = false.obs;

  validateEmail() {
    print("hay que validar el correo");
    final bool emailValid = RegExp(
            r"^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$")
        .hasMatch(ctrlCorreo.text);
    if (ctrlCorreo == "") {
      errorEmail.value = true;
    }
    if (emailValid) {
      errorEmail.value = true;
    } else {
      errorEmail.value = false;
    }
  }

  sorteo() async {
    AssistantsResponse aresponse = await InscripcionService.getAssistants();
    totalAsistentes.value = aresponse.assistants.length;
    var intValue = Random().nextInt(totalAsistentes.value);
    Get.defaultDialog(
        title: "Felicitaciones",
        middleText: aresponse.assistants[intValue].name ?? "Sin ganador",
        backgroundColor: Colors.teal,
        titleStyle: TextStyle(color: Colors.white),
        middleTextStyle: TextStyle(color: Colors.white),
        radius: 30);

    //ganador.value = aresponse.assistants[intValue] as Map;
    print(intValue);
    return true;
  }

  loadPerson() async {
    try {
      PersonResponse response =
          await InscripcionService.getPerson(ctrlCedula.text.trim());
      if (response != null) {
        personResponse = response;
        person = response.person;
        ifperson.value = true;
        return true;
      }
    } catch (e) {
      error.value = "$e";
      Get.snackbar(
        "Error",
        error.value,
        colorText: Colors.white,
        backgroundColor: Colors.red,
        icon: const Icon(Icons.error),
      );
      clear();
      return false;
    }
    return false;
  }

  registerPerson() async {
    validateEmail();
    try {
      if (!errorEmail.value) {
        Get.snackbar(
          "Error",
          "Es necesario un correo valido para el registro",
          colorText: Colors.white,
          backgroundColor: Colors.red,
          icon: const Icon(Icons.error),
        );
        return false;
      }
      person.correo = ctrlCorreo.text.trim();
      person.institucion = ctrlInstitucion.text.trim();
      person.cargo = ctrlCargo.text.trim();
      person.cellphone = ctrlCellPhone.text.trim();
      PersonResponse response = await InscripcionService.createPerson(person);
      AssistantsResponse aresponse = await InscripcionService.getAssistants();
      totalAsistentes.value = aresponse.assistants.length;
      print(totalAsistentes.value);

      // ignore: unnecessary_null_comparison
      if (response != null) {
        personResponse = response;
        ifperson.value = false;
        Get.snackbar(
          "Bienvenido",
          "Asistencia  registrada exitosamente",
          colorText: Colors.white,
          backgroundColor: Colors.blue,
          icon: const Icon(Icons.check_circle),
        );
        clear();
        return true;
      }
    } catch (e) {
      error.value = "$e";
      Get.snackbar(
        "Error",
        error.value,
        colorText: Colors.white,
        backgroundColor: Colors.red,
        icon: const Icon(Icons.error),
      );
      return false;
    }
    return false;
  }

  clear() {
    ctrlCargo.clear();
    ctrlCedula.clear();
    ctrlCorreo.clear();
    ctrlEdad.clear();
    ctrlInstitucion.clear();
    ctrlNombres.clear();
    ctrlresidencia.clear();
    ctrlCellPhone.clear();
  }

  onchange(String cedula) async {
    if (cedula.length == 10) {
      final verify = await loadPerson();
      print(verify);
      if (verify) {
        if (!person.attendance) {
          ctrlNombres.text = person.name;
          ctrlresidencia.text = person.home;
          ctrlEdad.text = person.age.toString();
          ctrlCorreo.text = person.correo!;
          ctrlInstitucion.text = person.institucion!;
          ctrlCargo.text = person.cargo!;
          ctrlCellPhone.text = person.cellphone!;
          isPreinscripcion.value = true;

          if (person.correo == "") {
            isPreinscripcion.value = false;
          }
        } else {
          Get.snackbar(
            "Bienvenido",
            "La Asistencia fue registrada con Anterioridad",
            colorText: Colors.white,
            backgroundColor: Colors.blue,
            icon: const Icon(Icons.check_circle),
          );
          ifperson.value = false;
        }
      }
    }
    print("volvemos al inicio");
    print("Es prescripcion = $isPreinscripcion");
  }

  // Future<void> loadPerson() async {
  //   const person = AuthenticationService.getPerson;
  //   Get.snackbar(
  //     "Titulo",
  //     "Display the message here",
  //     colorText: Colors.white,
  //     backgroundColor: Colors.lightBlue,
  //     icon: const Icon(Icons.add_alert),
  //   );
  // }
}
