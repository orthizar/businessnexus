import 'package:businessnexus/models/employee.dart';

class Business {
  int id;
  String name;
  List<Employee> employees;

  Business({
    required this.id,
    required this.name,
    this.employees = const [],
  });

  // Other properties and methods related to business management

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'employees': employees.map((employee) => employee.toJson()).toList(),
    };
  }

  factory Business.fromJson(Map<String, dynamic> json) {
    return Business(
      id: json['id'] as int,
      name: json['name'] as String,
      employees: (json['employees'] as List<dynamic>)
          .map((employeeJson) => Employee.fromJson(employeeJson))
          .toList(),
    );
  }
}
