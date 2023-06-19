import 'package:businessnexus/models/business.dart';
import 'package:businessnexus/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusinessFinancesSubmoduleScreen extends StatelessWidget {
  const BusinessFinancesSubmoduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Get.arguments == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // Defer the navigation until after the build phase
        Future.delayed(Duration.zero, () {
          Get.offNamed(Routes.overview);
        });
      });
      return Container();
    }
    final Business business = Get.arguments["business"];
    final Map<String, dynamic> submodule = Get.arguments["submodule"];
    return Scaffold(
      appBar: AppBar(
        title: Text('${submodule["title"]} of ${business.name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: submodule["details"],
      ),
    );
  }
}
