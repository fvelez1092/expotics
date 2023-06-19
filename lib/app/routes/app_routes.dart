part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const INSCRIPCIONES = _Paths.INSCRIPCIONES;
  static const PREINSCRIPCIONES = _Paths.PREINSCRIPCIONES;
}

abstract class _Paths {
  static const PREINSCRIPCIONES = '/';
  static const INSCRIPCIONES = '/inscripciones';
}
