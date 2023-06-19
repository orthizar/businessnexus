import 'package:businessnexus/controllers/business_controller.dart';
import 'package:businessnexus/models/business.dart';
import 'package:businessnexus/routes/app_routes.dart';
import 'package:businessnexus/widgets/bottommenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OverviewScreen extends StatelessWidget {
  final BusinessController businessController = Get.find<BusinessController>();

  OverviewScreen({super.key});

  void _createNewBusiness() {
    Get.toNamed(Routes.createBusiness)!.then((newBusiness) {
      if (newBusiness != null) {
        businessController.addBusiness(newBusiness);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Overview'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: Obx(
              () {
                return businessController.businesses.isNotEmpty
                    ? ListView.builder(
                        itemCount: businessController.businesses.length,
                        itemBuilder: (BuildContext context, int index) {
                          Business business =
                              businessController.businesses[index];
                          return ListTile(
                            onTap: () {
                              Get.toNamed(Routes.businessDashboard,
                                  arguments: {"business": business});
                            },
                            leading: const Icon(Icons.business),
                            title: Text(business.name),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Id: ${business.id}'),
                              ],
                            ),
                            trailing: const Icon(Icons.arrow_forward_ios),
                          );
                        },
                      )
                    : const ListTile(title: Text("No businesses yet."));
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createNewBusiness,
        child: const Icon(Icons.add_business),
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }
}
