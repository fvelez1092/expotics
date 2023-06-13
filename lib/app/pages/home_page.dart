import 'package:expotics/app/pages/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    //final claveFormulario = GlobalKey<FormState>();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: width,
              height: height * 0.33,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  tileMode: TileMode.mirror,
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromRGBO(24, 159, 224, 1),
                    Color.fromRGBO(16, 27, 171, 1),
                    Color.fromRGBO(24, 159, 224, 1),
                  ],
                ),
                //color: const Color.fromARGB(255, 24, 157, 223),
                border: Border(
                  bottom:
                      BorderSide(width: 2, color: Colors.lightBlue.shade900),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IntrinsicHeight(
                    child: SizedBox(
                      width: width * 0.33,
                      child: Image.asset(
                        'assets/images/logo_prefectura.png',
                        fit: BoxFit.contain,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  IntrinsicHeight(
                    child: SizedBox(
                      width: width * 0.34,
                      child: Image.asset(
                        'assets/images/expo_logo2.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  IntrinsicHeight(
                    child: SizedBox(
                      width: width * 0.33,
                      child: Image.asset(
                        'assets/images/manabitismo.png',
                        fit: BoxFit.contain,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: const Color.fromRGBO(255, 255, 255, 1),
              margin: EdgeInsets.symmetric(
                  horizontal: width < 420 ? width * 0.1 : width * 0.2),
              padding: EdgeInsets.symmetric(vertical: height * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() => Form(
                        child: controller.ifperson.value
                            ? _formPerson(controller: controller)
                            : _cedulaTextForm(controller: controller),
                      )),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Obx(() => SizedBox(
                        height: height * 0.05,
                        width: width < 420 ? width * 0.5 : width * 0.15,
                        child: MaterialButton(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          color: Get.theme.colorScheme.primary,
                          onPressed: controller.ifperson.value
                              ? () async {
                                  controller.registerPerson();
                                }
                              : null,
                          child: Text(
                            "Inscribete",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: width < 374 ? 8 : 18),
                          ),
                        ),
                      )),
                ],
              ),
            ),
            Container(
              width: width,
              height: height * 0.44,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/participantes.png"),
                    fit: BoxFit.fitWidth),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _formPerson extends StatelessWidget {
  const _formPerson({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _cedulaTextForm(controller: controller),
        Row(
          children: [
            Flexible(
              child: _textField(
                controller: controller.ctrlNombres,
                text: "Nombres",
                readonly: true,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Flexible(
              child: _textField(
                controller: controller.ctrlresidencia,
                text: "Residencia",
                readonly: true,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Flexible(
              child: _textField(
                controller: controller.ctrlEdad,
                text: "Edad",
                readonly: true,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Flexible(
              child: _textField(
                controller: controller.ctrlTelefono,
                text: "Teléfono",
              ),
            ),
          ],
        ),
        Obx(() => Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                //onChanged: controller.validateEmail(),
                controller: controller.ctrlCorreo,
                decoration: InputDecoration(
                    label: Text(
                      "Correo *",
                      style: TextStyle(
                          color: !controller.errorEmail.value
                              ? Colors.red
                              : Colors.grey[800]),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusColor: Colors.red,
                    hintText: "Ingrese un Correo Válido",
                    filled: true,
                    hintStyle: TextStyle(
                        color: !controller.errorEmail.value
                            ? Colors.red
                            : Colors.grey[800]),
                    fillColor: Colors.white70),
              ),
            )),
        Row(
          children: [
            Flexible(
              child: _textField(
                controller: controller.ctrlInstitucion,
                text: "Institución",
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Flexible(
              child: _textField(
                controller: controller.ctrlCargo,
                text: "Cargo",
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _cedulaTextForm extends StatelessWidget {
  const _cedulaTextForm({
    //super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        maxLength: 10,
        onChanged: (value) => controller.onchange(value),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Ingrese una cédula por favor';
          }
          return null;
        },
        controller: controller.ctrlCedula,
        decoration: InputDecoration(
            label: const Text("Cédula"),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            hintText: "Ingrese su Cédula",
            filled: true,
            hintStyle: TextStyle(color: Colors.grey[800]),
            fillColor: Colors.white70),
      ),
    );
  }
}

class _textField extends StatelessWidget {
  String text;
  bool? readonly = false;

  _textField({
    super.key,
    this.readonly,
    required this.controller,
    required this.text,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        // ignore: dead_code
        readOnly: readonly ?? false,
        controller: controller,
        decoration: InputDecoration(
            label: Text(text),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            hintText: text,
            filled: true,
            hintStyle: TextStyle(color: Colors.grey[800]),
            fillColor: Colors.white70),
      ),
    );
  }
}
