import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:businessnexus/models/employee.dart';

class EmployeeController extends GetxController {
  final RxList<Employee> employeees = <Employee>[].obs;
  final String storageKey = 'employeees';

  @override
  void onInit() {
    super.onInit();
    retrieveEmployeees();
  }

  void addEmployee(Employee employee) {
    employeees.add(employee);
    _debouncedSaveEmployeees();
  }

  Future<void> saveEmployeees() async {
    final prefs = await SharedPreferences.getInstance();
    final employeeesJson =
        employeees.map((employee) => employee.toJson()).toList();
    await prefs.setString(storageKey, json.encode(employeeesJson));
  }

  Future<void> retrieveEmployeees() async {
    final prefs = await SharedPreferences.getInstance();
    final employeeesJson = prefs.getString(storageKey);
    if (employeeesJson != null) {
      final employeeesData = json.decode(employeeesJson) as List<dynamic>;
      final retrievedEmployeees =
          employeeesData.map((data) => Employee.fromJson(data)).toList();
      employeees.addAll(retrievedEmployeees);
    }
  }

  final Duration debounceDuration = const Duration(seconds: 2);
  DateTime? lastSaveTime;

  void _debouncedSaveEmployeees() {
    final currentTime = DateTime.now();
    if (lastSaveTime == null ||
        currentTime.difference(lastSaveTime!) >= debounceDuration) {
      saveEmployeees();
      lastSaveTime = currentTime;
    }
  }
}
