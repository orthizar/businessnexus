class EmployeeType {
  final String type;

  EmployeeType(this.type);

  Map<String, dynamic> toJson() {
    return {
      'type': type,
    };
  }

  factory EmployeeType.fromJson(Map<String, dynamic> json) {
    return EmployeeType(
      json['type'] as String,
    );
  }
}

class Employee {
  final int id;
  final String name;
  final String surname;
  final EmployeeType employeeType;
  int salary;

  Employee(
      {required this.id,
      required this.name,
      required this.surname,
      required this.employeeType,
      required this.salary});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'surname': surname,
      'employeeType': employeeType.toJson(),
      'salary': salary,
    };
  }

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'] as int,
      name: json['name'] as String,
      surname: json['surname'] as String,
      employeeType: EmployeeType.fromJson(json['employeeType']),
      salary: json['salary'] as int,
    );
  }
}
