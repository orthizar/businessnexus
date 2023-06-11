import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:businessnexus/models/business.dart';

class BusinessController extends GetxController {
  final RxList<Business> businesses = <Business>[].obs;
  final String storageKey = 'businesses';

  @override
  void onInit() {
    super.onInit();
    retrieveBusinesses();
  }

  void addBusiness(Business business) {
    businesses.add(business);
    _debouncedSaveBusinesses();
  }

  Future<void> saveBusinesses() async {
    final prefs = await SharedPreferences.getInstance();
    final businessesJson =
        businesses.map((business) => business.toJson()).toList();
    await prefs.setString(storageKey, json.encode(businessesJson));
  }

  Future<void> retrieveBusinesses() async {
    final prefs = await SharedPreferences.getInstance();
    final businessesJson = prefs.getString(storageKey);
    if (businessesJson != null) {
      final businessesData = json.decode(businessesJson) as List<dynamic>;
      final retrievedBusinesses =
          businessesData.map((data) => Business.fromJson(data)).toList();
      businesses.addAll(retrievedBusinesses);
    }
  }

  final Duration debounceDuration = const Duration(seconds: 2);
  DateTime? lastSaveTime;

  void _debouncedSaveBusinesses() {
    final currentTime = DateTime.now();
    if (lastSaveTime == null ||
        currentTime.difference(lastSaveTime!) >= debounceDuration) {
      saveBusinesses();
      lastSaveTime = currentTime;
    }
  }

  @override
  void onClose() {
    saveBusinesses();
    super.onClose();
  }
}
