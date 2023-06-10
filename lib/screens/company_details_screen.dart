import 'package:flutter/material.dart';
import 'package:businessnexus/components/company.dart';

class BusinessDetailScreen extends StatelessWidget {
  final Company company;

  const BusinessDetailScreen({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(company.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Level: ${company.level}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Umsatz: \$${company.revenue}',
              style: const TextStyle(fontSize: 18),
            ),
            // Add more details or components as needed
          ],
        ),
      ),
    );
  }
}
