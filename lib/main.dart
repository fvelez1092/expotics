import 'package:expotics/app/routes/app_pages.dart';
import 'package:expotics/theme.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';

void main() async {
  await GetStorage.init();
  runApp(GetMaterialApp(
    //useInheritedMediaQuery: true,
    debugShowCheckedModeBanner: false,
    title: "Expo Tecnologia",
    initialRoute: AppPages.INITIAL,
    getPages: AppPages.routes,
    defaultTransition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 300),
    theme: lightTheme,
  ));
}
