import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pruebatyba/routes/routes.dart';
import 'package:pruebatyba/utils/initial_bindings.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Prueba Tyba",
      initialBinding: InitialBindings(),
      initialRoute: AppRoutes.initialRoute,
      getPages: AppRoutes.pages,
    );
  }
}
