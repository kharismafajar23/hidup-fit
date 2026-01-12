import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/pages/screening/controllers/screening_entry_controller.dart';
import 'package:hidup_fit/utils/device/device_utility.dart';

class ScreeningEntryView extends GetView<ScreeningEntryController> {
  const ScreeningEntryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Screening Kesehatan")),
      body: Center(
        child: Obx(() {
          if (controller.isChecking.value) {
            return const CircularProgressIndicator();
          }

          return SizedBox(
            width: MyDeviceUtils.getScreenWidth(context),
            child: ElevatedButton(
              onPressed: controller.startNewScreening,
              child: const Text('Mulai Screening'),
            ).paddingSymmetric(horizontal: 20),
          );
        }),
      ),
    );
  }
}
