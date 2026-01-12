import 'package:get/get.dart';
import 'package:hidup_fit/pages/screening/controllers/screening_controller.dart';

class ScreeningBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ScreeningController());
  }
}
