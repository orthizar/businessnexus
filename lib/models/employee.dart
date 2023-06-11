class Employee {
  final int id;
  final String name;
  final String surname;
  final String employeeType;
  double salary;
  double lowerBound;
  double upperBound;

  Employee(
      {required this.id,
      required this.name,
      required this.surname,
      required this.employeeType,
      required this.salary,
      required this.lowerBound,
      required this.upperBound});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'surname': surname,
      'employeeType': employeeType,
      'salary': salary,
      'lowerBound': lowerBound,
      'upperBound': upperBound,
    };
  }

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'] as int,
      name: json['name'] as String,
      surname: json['surname'] as String,
      employeeType: json['employeeType'] as String,
      salary: json['salary'] as double,
      lowerBound: json['lowerBound'] as double,
      upperBound: json['upperBound'] as double,
    );
  }
}
