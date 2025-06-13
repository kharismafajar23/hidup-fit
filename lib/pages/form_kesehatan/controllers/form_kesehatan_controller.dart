import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormKesehatanController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  TextEditingController tanggalController = TextEditingController();
  RxBool validateTanggal = true.obs;
  RxString msgTanggal = "".obs;

  Future<void> selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      tanggalController.text = picked.toIso8601String().split('T')[0];
    }
  }
}
