import 'package:businessnexus/models/business.dart';
import 'package:businessnexus/responsive.dart';
import 'package:businessnexus/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusinessFinancesScreen extends StatelessWidget {
  final RxInt expandedSubmodule = RxInt(-1);

  BusinessFinancesScreen({super.key});

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

    var submodules = [
      {
        'title': 'Transactions',
        'iconData': Icons.payments,
        'info': 'Balance: ${business.financeModule.balance}',
        'details': business.financeModule.transactions
            .map(
              (e) =>
                  '#${e.id} - ${e.creationDate} - ${e.total} - ${e.description}',
            )
            .toList(),
      },
      {
        'title': 'Bills',
        'iconData': Icons.payments,
        'info':
            'Bills: ${business.financeModule.bills.where((element) => !element.isPaid).length}',
        'details': business.financeModule.bills
            .map((e) => // Display date in format dd.mm.yyyy hh:mm
                '#${e.id} - ${e.dueDate.toString().substring(0, 16)} - ${e.total} - ${e.items.map((e) => e.name).join(', ')}')
            .toList(),
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Finances of ${Get.arguments["business"].name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: submodules.length,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
            crossAxisSpacing: !Responsive.isMobile(context) ? 15 : 12,
            mainAxisSpacing: 12.0,
          ),
          itemBuilder: (context, i) {
            return GestureDetector(
              onTap: () {
                if (expandedSubmodule.value == i) {
                  expandedSubmodule.value = -1;
                } else {
                  expandedSubmodule.value = i;
                }
              },
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(submodules[i]['iconData'] as IconData?),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 4),
                      child: Text(
                        submodules[i]['title'] as String,
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(
                      submodules[i]['info'] as String,
                      style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal),
                    ),
                    Obx(() {
                      if (expandedSubmodule.value == i) {
                        return Expanded(
                          child: ListView.builder(
                            itemCount:
                                (submodules[i]['details'] as List<dynamic>)
                                    .length,
                            itemBuilder: (context, j) {
                              return Text(
                                (submodules[i]['details'] as List<dynamic>)[j],
                                style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.normal),
                              );
                            },
                          ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    }),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
