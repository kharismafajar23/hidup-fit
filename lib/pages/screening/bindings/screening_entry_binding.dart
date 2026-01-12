import 'package:get/get.dart';
import 'package:hidup_fit/pages/screening/controllers/screening_entry_controller.dart';

class ScreeningEntryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ScreeningEntryController());
  }
}
