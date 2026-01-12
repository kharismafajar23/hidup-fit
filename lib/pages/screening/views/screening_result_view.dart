import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/common/widgets/scrollable_widget.dart';
import 'package:hidup_fit/pages/screening/controllers/screening_result_controller.dart';
import 'package:hidup_fit/utils/constant/colors.dart';

class ScreeningResultView extends GetView<ScreeningResultController> {
  const ScreeningResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hasil Skrining")),
      body: ScrollableScreen(child: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          ).marginOnly(top: 12);
        }
        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(12)),
          child: Column(
            children: [
              Text(
                controller.analysisResult.value,
                style: TextStyle(color: MyColors.textPrimary, fontWeight: FontWeight.w300),
              ),
              Text('Jika ingin mendapat hasil yang lebih detail, silahkan kunjungi klinik kesehatan terdekat').marginOnly(top: 16),
              Text('Anda telah terdaftar sebagai pengguna HidupFit').marginOnly(top: 16),
            ],
          ).paddingAll(12),
        );
      })),
    );
  }
}
