import 'package:businessnexus/controllers/business_controller.dart';
import 'package:get/get.dart';

class BusinessFinancesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BusinessController());
  }
}
