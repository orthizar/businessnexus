import 'package:businessnexus/models/modules/finances.dart';

class Business {
  int id;
  String name;
  late FinanceModule financeModule;

  Business({
    required this.id,
    required this.name,
    FinanceModule? financeModule,
  }) {
    this.financeModule = financeModule ?? FinanceModule();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'financeModule': financeModule.toJson(),
    };
  }

  factory Business.fromJson(Map<String, dynamic> json) {
    return Business(
      id: json['id'] as int,
      name: json['name'] as String,
      financeModule: FinanceModule.fromJson(json['financeModule']),
    );
  }
}
