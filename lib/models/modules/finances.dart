import 'package:businessnexus/models/bill.dart';
import 'package:businessnexus/models/transaction.dart';

class FinanceModule {
  List<Bill> bills;
  List<Transaction> transactions;
  double get balance {
    double total = 0;
    for (var transaction in transactions) {
      total += transaction.total;
    }
    return total;
  }

  FinanceModule({
    this.bills = const [],
    this.transactions = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      'bills': bills.map((bill) => bill.toJson()).toList(),
      'transactions':
          transactions.map((transaction) => transaction.toJson()).toList(),
    };
  }

  factory FinanceModule.fromJson(Map<String, dynamic> json) {
    return FinanceModule(
      bills: (json['bills'] as List<Map<String, dynamic>>)
          .map((billJson) => Bill.fromJson(billJson))
          .toList(),
      transactions: (json['transactions'] as List<Map<String, dynamic>>)
          .map((transactionJson) => Transaction.fromJson(transactionJson))
          .toList(),
    );
  }
}
