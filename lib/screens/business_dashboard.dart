import 'package:businessnexus/models/business.dart';
import 'package:businessnexus/responsive.dart';
import 'package:businessnexus/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusinessDashboardScreen extends StatelessWidget {
  const BusinessDashboardScreen({super.key});

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
    final List<Map<String, dynamic>> cards = [
      {
        'title': 'Finances',
        'iconData': Icons.payments,
        'info':
            'Balance: ${business.financeModule.balance}\nBills: ${business.financeModule.bills.where((element) => !element.isPaid).length}',
        'route': Routes.businessFinances,
      },
      // {
      //   'title': 'Employees',
      //   'iconData': Icons.engineering,
      //   'info': 'Employees: ${business.employees.employees.length}',
      //   'route': Routes.businessEmployees,
      // },
      // {
      //   'title': 'Inventory',
      //   'iconData': Icons.shelves,
      //   'info': 'Items: ${business.inventory.items.length}',
      //   'route': Routes.businessInventory,
      // },
      // {
      //   'title': 'Production',
      //   'iconData': Icons.factory,
      //   'info': 'Production: ${business.production.output}',
      //   'route': Routes.businessProduction,
      // },
      // {
      //   'title': 'Sales',
      //   'iconData': Icons.shopping_cart_checkout,
      //   'info': 'Sales: ${business.sales.sales.length}',
      //   'route': Routes.businessSales,
      // },
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(Get.arguments["business"].name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
            itemCount: cards.length,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
                crossAxisSpacing: !Responsive.isMobile(context) ? 15 : 12,
                mainAxisSpacing: 12.0),
            itemBuilder: (context, i) {
              return Card(
                child: InkWell(
                  onTap: () {
                    Get.toNamed(cards[i]['route'],
                        arguments: {"business": business});
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(cards[i]['iconData']),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 4),
                        child: Text(
                          cards[i]['title'],
                          style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Text(
                        cards[i]['info'],
                        style: const TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
