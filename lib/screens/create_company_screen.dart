import 'package:businessnexus/components/company.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateCompanyScreen extends StatefulWidget {
  const CreateCompanyScreen({super.key});

  @override
  CreateCompanyScreenState createState() => CreateCompanyScreenState();
}

class CreateCompanyScreenState extends State<CreateCompanyScreen> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _createCompany() {
    String companyName = _nameController.text.trim();
    if (companyName.isNotEmpty) {
      Company newCompany = Company(name: companyName, level: 1, revenue: 0);
      Get.back(result: newCompany);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create new Company'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Company Name',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _createCompany,
              child: const Text('Create Company'),
            ),
          ],
        ),
      ),
    );
  }
}
