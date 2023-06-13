import 'package:businessnexus/models/modules/finances.dart';

class Business {
  int id;
  String name;
  FinanceModule financeModule = FinanceModule();

  Business({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory Business.fromJson(Map<String, dynamic> json) {
    return Business(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }
}
