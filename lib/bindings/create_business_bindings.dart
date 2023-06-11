import 'package:businessnexus/controllers/business_controller.dart';
import 'package:get/get.dart';

class CreateBusinessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BusinessController());
  }
}
