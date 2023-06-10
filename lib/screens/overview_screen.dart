import 'package:businessnexus/components/company.dart';
import 'package:businessnexus/screens/company_details_screen.dart';
import 'package:businessnexus/screens/create_company_screen.dart';
import 'package:businessnexus/widgets/bottommenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({Key? key}) : super(key: key);

  @override
  OverviewScreenState createState() => OverviewScreenState();
}

class OverviewScreenState extends State<OverviewScreen> {
  void _createNewCompany() {
    Get.to(const CreateCompanyScreen())!.then((newCompany) {
      if (newCompany != null) {
        setState(() {
          companies.add(newCompany);
        });
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
            child: companies.isNotEmpty
                ? ListView.builder(
                    itemCount: companies.length,
                    itemBuilder: (BuildContext context, int index) {
                      Company company = companies[index];
                      return ListTile(
                        onTap: () {
                          Get.off(() => BusinessDetailScreen(company: company));
                        },
                        leading: const Icon(Icons.business),
                        title: Text(company.name),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Level: ${company.level}'),
                            Text('Umsatz: \$${company.revenue}'),
                          ],
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      );
                    },
                  )
                : const Text("No companies yet."),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createNewCompany,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }
}
