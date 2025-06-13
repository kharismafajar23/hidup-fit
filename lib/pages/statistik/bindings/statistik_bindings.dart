import 'package:get/get.dart';
import 'package:hidup_fit/pages/statistik/controllers/statistik_controller.dart';

class StatistikBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(StatistikController()); // langsung inject, bukan lazy
  }
}
