// ignore_for_file: unrelated_type_equality_checks

import 'package:expotics/app/models/person_model.dart';
import 'package:expotics/app/responses/person_response.dart';
import 'package:expotics/app/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
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
  TextEditingController ctrlTelefono = TextEditingController();

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

  loadPerson() async {
    try {
      PersonResponse response =
          await AuthenticationService.getPerson(ctrlCedula.text.trim());
      if (response != null) {
        personResponse = response;
        print(personResponse.toString());
        person = personResponse.person;
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
      person.cellphone = ctrlTelefono.text.trim();
      PersonResponse response =
          await AuthenticationService.createPerson(person);
      print("esta es la respuesta");
      print(response);
      // ignore: unnecessary_null_comparison
      if (response != null) {
        personResponse = response;
        //print("esta es la respuesta");
        //print(personResponse.toString());
        ifperson.value = false;
        Get.snackbar(
          "Bien Hecho",
          "Persona registrada exitosamente",
          colorText: Colors.white,
          backgroundColor: Colors.green,
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
    ctrlTelefono.clear();
  }

  onchange(String cedula) async {
    if (cedula.length == 10) {
      print("Aqui ejecutamos la consulta");
      print(cedula);
      final verify = await loadPerson();
      if (verify) {
        ctrlNombres.text = personResponse.person.name;
        ctrlresidencia.text = personResponse.person.home;
        ctrlEdad.text = personResponse.person.age.toString();
        ctrlCorreo.text = personResponse.person.correo!;
        ctrlInstitucion.text = personResponse.person.institucion!;
        ctrlCargo.text = personResponse.person.cargo!;
        print(personResponse.person.name);
      }
    }
    print("volvemos al inicio");
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
