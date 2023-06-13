import 'package:businessnexus/models/item.dart';
import 'package:businessnexus/models/service.dart';

class Bill {
  String status;
  DateTime dueDate;
  double total;
  List<Item> items;
  List<Service> services;

  Bill({
    required this.status,
    required this.dueDate,
    required this.total,
    this.items = const [],
    this.services = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'dueDate': dueDate.toIso8601String(),
      'total': total,
      'items': items.map((item) => item.toJson()).toList(),
      'services': services.map((service) => service.toJson()).toList(),
    };
  }

  factory Bill.fromJson(Map<String, dynamic> json) {
    return Bill(
      status: json['status'] as String,
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
