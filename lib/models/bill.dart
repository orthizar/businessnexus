import 'package:businessnexus/models/item.dart';
import 'package:businessnexus/models/service.dart';

class Bill {
  int id;
  bool isPaid;
  DateTime dueDate;
  double total;
  List<Item> items;
  List<Service> services;

  Bill({
    required this.id,
    required this.isPaid,
    required this.dueDate,
    required this.total,
    this.items = const [],
    this.services = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': isPaid,
      'dueDate': dueDate.toIso8601String(),
      'total': total,
      'items': items.map((item) => item.toJson()).toList(),
      'services': services.map((service) => service.toJson()).toList(),
    };
  }

  factory Bill.fromJson(Map<String, dynamic> json) {
    return Bill(
      id: json['id'] as int,
      isPaid: json['isPaid'] as bool,
      dueDate: DateTime.parse(json['dueDate'] as String),
      total: json['total'] as double,
      items: (json['items'] as List<Map<String, dynamic>>)
          .map((itemJson) => Item.fromJson(itemJson))
          .toList(),
      services: (json['services'] as List<Map<String, dynamic>>)
          .map((serviceJson) => Service.fromJson(serviceJson))
          .toList(),
    );
  }
}
