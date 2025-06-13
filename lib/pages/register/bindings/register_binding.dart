import 'package:get/get.dart';
import 'package:hidup_fit/pages/register/controllers/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RegisterController()); // langsung inject, bukan lazy
  }
}
