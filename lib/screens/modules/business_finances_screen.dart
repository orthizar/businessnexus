import 'package:businessnexus/models/business.dart';
import 'package:businessnexus/responsive.dart';
import 'package:businessnexus/routes/app_routes.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusinessFinancesScreen extends StatelessWidget {
  const BusinessFinancesScreen({super.key});

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
        'details': DataTable2(
          isHorizontalScrollBarVisible: true,
          isVerticalScrollBarVisible: true,
          columnSpacing: 12,
          horizontalMargin: 12,
          // min width screen width minus margin and scrollbar width
          minWidth: MediaQuery.of(context).size.width - 16 * 2,
          columns: const [
            DataColumn2(label: Text('ID'), size: ColumnSize.S),
            DataColumn2(label: Text('Bill ID'), size: ColumnSize.S),
            DataColumn2(label: Text('Creation'), size: ColumnSize.M),
            DataColumn2(label: Text('Completion'), size: ColumnSize.M),
            DataColumn2(label: Text('Amount'), size: ColumnSize.S),
            DataColumn2(label: Text('Description'), size: ColumnSize.L),
          ],
          rows: business.financeModule.transactions
              .map((e) => DataRow(cells: [
                    DataCell(
                      Text('#${e.id}'),
                    ),
                    DataCell(
                      e.billId == null ? Container() : Text('#${e.billId}'),
                    ),
                    DataCell(Text(e.creationDate.toString().substring(0, 16))),
                    DataCell(e.isPending
                        ? const Text('Pending')
                        : Text(e.completionDate.toString().substring(0, 16))),
                    DataCell(Text(e.amount.toString())),
                    DataCell(Text(e.description)),
                  ]))
              .toList(),
        ),
      },
      {
        'title': 'Bills',
        'iconData': Icons.payments,
        'info':
            'Bills: ${business.financeModule.bills.where((element) => !element.isPaid).length}',
        'details': DataTable2(
          isHorizontalScrollBarVisible: true,
          isVerticalScrollBarVisible: true,
          columnSpacing: 12,
          horizontalMargin: 12,
          minWidth: MediaQuery.of(context).size.width - 16 * 2,
          columns: const [
            DataColumn2(label: Text('ID'), size: ColumnSize.S),
            DataColumn2(label: Text('Due'), size: ColumnSize.M),
            DataColumn2(label: Text('Paid'), size: ColumnSize.M),
            DataColumn2(label: Text('Total'), size: ColumnSize.S),
            DataColumn2(label: Text('Items'), size: ColumnSize.L),
            DataColumn2(label: Text('Services'), size: ColumnSize.L),
          ],
          rows: business.financeModule.bills
              .map((e) => DataRow(cells: [
                    DataCell(
                      Text('#${e.id}'),
                    ),
                    DataCell(Text(e.dueDate.toString().substring(0, 16))),
                    DataCell(
                      e.isPaid ? const Text('Paid') : const Text('Unpaid'),
                    ),
                    DataCell(Text(e.total.toString())),
                    DataCell(Text(e.items.map((e) => e.name).join(', '))),
                    DataCell(Text(e.services.map((e) => e.name).join(', '))),
                  ]))
              .toList(),
        ),
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
              crossAxisCount: !Responsive.isMobile(context) ? 4 : 2,
              crossAxisSpacing: !Responsive.isMobile(context) ? 15 : 12,
              mainAxisSpacing: 12.0,
            ),
            itemBuilder: (context, i) {
              return Card(
                child: InkWell(
                  onTap: () {
                    Get.toNamed(Routes.businessFinancesSubmodule, arguments: {
                      'business': business,
                      'submodule': submodules[i]
                    });
                  },
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
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
