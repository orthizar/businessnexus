import 'package:businessnexus/controllers/business_controller.dart';
import 'package:businessnexus/models/business.dart';
import 'package:businessnexus/models/employee.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateBusinessScreen extends StatefulWidget {
  const CreateBusinessScreen({super.key});

  @override
  CreateBusinessScreenState createState() => CreateBusinessScreenState();
}

class CreateBusinessScreenState extends State<CreateBusinessScreen> {
  final TextEditingController _nameController = TextEditingController();
  final BusinessController businessController = Get.find<BusinessController>();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _createBusiness() {
    String businessName = _nameController.text.trim();
    if (businessName.isNotEmpty) {
      Business newBusiness = Business(
          id: businessController.businesses.length,
          name: businessName,
          employees: [
            Employee(
              id: 1,
              name: 'John',
              surname: 'Doe',
              employeeType: 'Manager',
              salary: 5000,
              lowerBound: 4000,
              upperBound: 6000,
            ),
          ]);
      Get.back(result: newBusiness);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create new Business'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Business Name',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _createBusiness,
              child: const Text('Create Business'),
            ),
          ],
        ),
      ),
    );
  }
}
