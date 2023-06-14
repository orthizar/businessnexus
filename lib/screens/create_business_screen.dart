import 'package:businessnexus/controllers/business_controller.dart';
import 'package:businessnexus/models/bill.dart';
import 'package:businessnexus/models/business.dart';
import 'package:businessnexus/models/item.dart';
import 'package:businessnexus/models/transaction.dart';
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
      );
      newBusiness.financeModule.bills.add(Bill(
        id: 0,
        dueDate: DateTime.now(),
        items: [
          Item(id: 0, name: 'Test Item', price: 10.0, quantity: 1),
        ],
        isPaid: false,
        total: 999.95,
      ));
      newBusiness.financeModule.transactions.add(Transaction(
        id: 0,
        description: 'Test Transaction',
        total: 399.50,
        creationDate: DateTime.now(),
        isPending: true,
      ));
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
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => _createBusiness(),
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
