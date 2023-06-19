import 'package:expotics/app/pages/inscripciones/inscripciones_controller.dart';
import 'package:get/get.dart';

class InscripcionesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InscripcionesController>(() => InscripcionesController());
  }
}
