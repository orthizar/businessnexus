import 'package:businessnexus/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:businessnexus/models/business.dart';
import 'package:get/get.dart';

class BusinessDetailsScreen extends StatelessWidget {
  const BusinessDetailsScreen({super.key});

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
    Business business = Get.arguments["business"];
    return Scaffold(
      appBar: AppBar(
        title: Text(Get.arguments["business"].name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text(
              'Umsatz: ${business.revenue}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
