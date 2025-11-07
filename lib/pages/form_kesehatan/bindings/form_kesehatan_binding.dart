import 'package:get/get.dart';
import 'package:hidup_fit/pages/form_kesehatan/controllers/form_kesehatan_controller.dart';

class FormKesehatanBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FormKesehatanController());
  }
}
