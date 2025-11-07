import 'package:get/get.dart';
import 'package:hidup_fit/pages/riwayat_kesehatan/controllers/riwayat_kesehatan_controller.dart';

class RiwayatKesehatanBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RiwayatKesehatanController()); // langsung inject, bukan lazy
  }
}
