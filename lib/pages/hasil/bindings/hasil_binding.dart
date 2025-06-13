import 'package:get/get.dart';
import 'package:hidup_fit/pages/hasil/controllers/hasil_controller.dart';

class HasilBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HasilController()); // langsung inject, bukan lazy
  }
}
