class EmployeeType {
  final String type;
  EmployeeType(this.type);
}

class Employee {
  final String name;
  final String surname;
  final EmployeeType employeeType;
  int salary;

  Employee({required this.name, required this.surname, required this.employeeType, required this.salary});
}