import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/common/widgets/info_item.dart';
import 'package:hidup_fit/common/widgets/scrollable_widget.dart';
import 'package:hidup_fit/common/widgets/title_app.dart';
import 'package:hidup_fit/data/services/format_tanggal.dart';
import 'package:hidup_fit/utils/constant/colors.dart';
import 'package:hidup_fit/utils/device/device_utility.dart';
import 'package:hidup_fit/utils/theme/widget_themes/text_styles.dart';

import '../controllers/statistik_controller.dart';

class StatistikView extends GetView<StatistikController> {
  const StatistikView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollableScreen(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleApp().marginOnly(bottom: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Pantau & Analisis Kesehatanmu',
                style: MyTextStyles.headingText.copyWith(
                  color: MyColors.primary,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ).marginOnly(bottom: 2),
              Text(
                'Lihat perkembangan kondisi tubuh dari waktu ke waktu dan temukan pola kesehatanmu secara otomatis',
                style: MyTextStyles.paragraphText.copyWith(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ).marginOnly(bottom: 20),
          Obx(
            () => Container(
              width: MyDeviceUtils.getScreenWidth(context),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Statistics',
                      style: MyTextStyles.paragraphText.copyWith(color: MyColors.darkGrey),
                    ),
                    const Text(
                      'Kesehatanmu',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ).marginOnly(bottom: 4),
                    Divider(
                      color: Colors.grey.withOpacity(0.5),
                      thickness: 1,
                    ).marginOnly(bottom: 4),
                    InfoItem(
                      leading: const Icon(Icons.calendar_month),
                      title: 'Tanggal',
                      subtitle: formatTanggal(controller.dataKesehatan['tanggal']?.toString() ?? '-'),
                    ).marginOnly(bottom: 8),

                    // --- Row 1 ---
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: InfoItem(
                            leading: const Icon(Icons.monitor_weight_outlined),
                            title: 'Berat Badan',
                            subtitle: '${controller.dataKesehatan['beratBadan'] ?? '-'} kg',
                          ),
                        ),
                        Expanded(
                          child: InfoItem(
                            leading: const Icon(Icons.bloodtype_outlined),
                            title: 'Tekanan Darah',
                            subtitle: '${controller.dataKesehatan['tekananDarah'] ?? '-'} mmHg',
                          ),
                        ),
                        Expanded(
                          child: InfoItem(
                            leading: const Icon(Icons.monitor_heart_outlined),
                            title: 'Detak Jantung',
                            subtitle: '${controller.dataKesehatan['detakJantung'] ?? '-'} bpm',
                          ),
                        ),
                      ],
                    ).marginOnly(bottom: 8),

                    // --- Row 2 ---
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: InfoItem(
                            leading: const Icon(Icons.boy_rounded),
                            title: 'Tinggi Badan',
                            subtitle: '${controller.dataKesehatan['tinggiBadan'] ?? '-'} cm',
                          ),
                        ),
                        Expanded(
                          child: InfoItem(
                            leading: const Icon(Icons.thermostat),
                            title: 'Suhu Tubuh',
                            subtitle: '${controller.dataKesehatan['suhuTubuh'] ?? '-'} °C',
                          ),
                        ),
                        Expanded(
                          child: InfoItem(
                            leading: const Icon(Icons.directions_walk_rounded),
                            title: 'Jumlah Langkah',
                            subtitle: controller.dataKesehatan['jumlahLangkah']?.toString() ?? '-',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ).marginOnly(bottom: 24),

          // Ringkasan Kesehatan
          Text(
            'Ringkasan Kesehatan',
            style: MyTextStyles.headingText.copyWith(
              color: MyColors.primary,
              fontSize: 20,
            ),
          ).marginOnly(bottom: 2),
          Obx(() {
            if (controller.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              ).marginOnly(top: 12);
            }
            return Text(
              controller.analysisResult.value.isEmpty ? 'Belum ada analisis.' : controller.analysisResult.value,
              style: MyTextStyles.paragraphText.copyWith(
                fontSize: 15,
                fontStyle: FontStyle.italic,
              ),
            ).marginOnly(top: 8);
          }),
        ],
      ),
    );
  }
}
