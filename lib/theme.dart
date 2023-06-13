import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorsApp {
  static const greenLight = Color(0xFF1abc9c);
  static const blackLight = Color(0xFF2c3e50);
  static const blueStrong = Color(0xFF131045);
  static const cyanStrong = Color(0xFF29C4F8);
  static const cyan = Color(0xFF4AF3F8);
  static const grey = Colors.grey;
  static const lightGrey = Color(0xffbbbbbb);
  static const veryLigGray = Color(0xfff3f3f3);
  static const white = Color(0xffffffff);
  static const black = Color(0xff000000);
  static const red = Color(0xffff0060);
  static const yellow = Colors.yellow;
  static const hintText = Color(0xff9e9e9e);
  static const background = Color(0xffF5F8FA);
  static const titles = Color(0xff333333);
  static const success = Color(0xff50CD89);
}

// final gradiantColors = [ColorsApp.green, ColorsApp.yellow];
// final gradiantColorsR = [ColorsApp.blue, ColorsApp.dark];

final lightTheme = ThemeData(
  textTheme: GoogleFonts.robotoTextTheme(),
  fontFamily: GoogleFonts.roboto().fontFamily,
  colorScheme: const ColorScheme(
      primary: Color.fromRGBO(16, 115, 165, 1),
      primaryContainer: Color.fromRGBO(16, 27, 171, 1),
      secondary: ColorsApp.blackLight,
      secondaryContainer: ColorsApp.cyan,
      surface: Color(0XFFFFFFFF),
      background: ColorsApp.background,
      error: ColorsApp.red,
      onPrimary: ColorsApp.titles,
      onSecondary: ColorsApp.cyanStrong,
      onSurface: ColorsApp.grey,
      onBackground: ColorsApp.lightGrey,
      onPrimaryContainer: Color(0xff0080F6),
      onSecondaryContainer: ColorsApp.cyan,
      onInverseSurface: ColorsApp.success,
      onError: ColorsApp.red,
      brightness: Brightness.light),
);
