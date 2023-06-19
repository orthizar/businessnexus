import 'package:businessnexus/models/bill.dart';
import 'package:businessnexus/models/transaction.dart';
import 'package:get/get.dart';

class FinanceModule {
  RxList<Bill> bills = <Bill>[].obs;
  RxList<Transaction> transactions = <Transaction>[].obs;
  var balance = 0.0.obs;

  FinanceModule({
    List<Bill>? bills,
    List<Transaction>? transactions,
  }) {
    this.bills = (bills ?? <Bill>[]).obs;
    this.transactions = (transactions ?? <Transaction>[]).obs;
    this.transactions.listen((_) {
      _calculateBalance();
    });
    _calculateBalance();
  }

  void _calculateBalance() {
    double total = 0;
    for (var transaction in transactions) {
      total += transaction.amount;
    }
    balance.value = total;
  }

  Map<String, dynamic> toJson() {
    return {
      'bills': bills.map((bill) => bill.toJson()).toList(),
      'transactions':
          transactions.map((transaction) => transaction.toJson()).toList(),
    };
  }

  factory FinanceModule.fromJson(Map<String, dynamic> json) {
    return FinanceModule(
      bills: (json['bills'] as List<dynamic>)
          .map((billJson) => Bill.fromJson(billJson))
          .toList(),
      transactions: (json['transactions'] as List<dynamic>)
          .map((transactionJson) => Transaction.fromJson(transactionJson))
          .toList(),
    );
  }
}
