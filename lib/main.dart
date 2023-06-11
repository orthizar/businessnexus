import 'package:businessnexus/controllers/business_controller.dart';
import 'package:businessnexus/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(BusinessNexusApp());
}

class BusinessNexusApp extends StatelessWidget {
  final BusinessController businessController = Get.put(BusinessController());

  BusinessNexusApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Business Nexus",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.teal,
      ),
      themeMode: ThemeMode.dark,
    );
  }
}
