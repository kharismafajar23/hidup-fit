import 'package:get/get.dart';
import 'package:hidup_fit/pages/target/controllers/target_controller.dart';

class TargetBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TargetController()); // langsung inject, bukan lazy
  }
}
