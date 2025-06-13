import 'package:get/get.dart';

import '../controllers/verifikasi_otp_controller.dart';

class VerifikasiOTPBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(VerifikasiOtpController());
  }
}
