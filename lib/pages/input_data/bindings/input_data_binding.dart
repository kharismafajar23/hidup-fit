import 'package:get/get.dart';
import 'package:hidup_fit/pages/input_data/controllers/input_data_controller.dart';

class InputDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InputDataController()); // langsung inject, bukan lazy
  }
}
