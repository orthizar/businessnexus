import 'package:businessnexus/screens/overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    title: "Business Nexus",
    home: const OverviewScreen(),
    darkTheme: ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorSchemeSeed: Colors.teal,
    ),
    themeMode: ThemeMode.dark,
  ));
}
