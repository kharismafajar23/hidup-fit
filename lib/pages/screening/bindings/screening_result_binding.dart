import 'package:get/get.dart';
import 'package:hidup_fit/pages/screening/controllers/screening_result_controller.dart';

class ScreeningResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ScreeningResultController());
  }
}
