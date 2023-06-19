import 'package:expotics/app/pages/inscripciones/inscripciones_binding.dart';
import 'package:expotics/app/pages/inscripciones/inscripciones_page.dart';
import 'package:expotics/app/pages/preinscripciones/home_binding.dart';
import 'package:expotics/app/pages/preinscripciones/home_page.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.PREINSCRIPCIONES;

  static final routes = [
    GetPage(
      name: _Paths.PREINSCRIPCIONES,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.INSCRIPCIONES,
      page: () => InscripcionesPage(),
      binding: InscripcionesBinding(),
    ),
  ];
}
