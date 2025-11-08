import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/common/widgets/info_badge.dart';
import 'package:hidup_fit/common/widgets/info_item.dart';
import 'package:hidup_fit/common/widgets/scrollable_widget.dart';
import 'package:hidup_fit/common/widgets/title_app.dart';
import 'package:hidup_fit/data/services/format_tanggal.dart';
import 'package:hidup_fit/data/services/get_health_color.dart';
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
            () {
              if (controller.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                ).marginOnly(top: 12);
              }

              return Container(
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
              );
            },
          ).marginOnly(bottom: 24),
          Obx(() {
            if (controller.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              ).marginOnly(top: 12);
            }

            final data = controller.analysisResultFormatted.value;

            if (data == null) {
              return const Text('Belum ada hasil analisis.');
            }

            return Container(
              width: MyDeviceUtils.getScreenWidth(context),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsetsGeometry.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hasil',
                      style: MyTextStyles.paragraphText.copyWith(color: MyColors.darkGrey),
                    ),
                    const Text(
                      'Analisa Kesehatan',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(
                      color: Colors.grey.withValues(alpha: .5),
                      thickness: 1,
                    ).marginOnly(bottom: 4),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: AlignmentGeometry.centerLeft,
                            child: InfoBadge(
                              title: 'Kondisi',
                              subtitle: '${data['kondisi_kesehatan']}',
                              color: getHealthColor('kondisi_kesehatan', data['kondisi_kesehatan']),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentGeometry.centerLeft,
                            child: InfoBadge(
                              title: 'Berat Badan',
                              subtitle: '${data['ringkasan']['berat_badan']}',
                              color: getHealthColor('berat_badan', data['ringkasan']['berat_badan']),
                            ),
                          ),
                        ),
                      ],
                    ).marginOnly(bottom: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: InfoBadge(
                              title: 'Tekanan Darah',
                              subtitle: '${data['ringkasan']['tekanan_darah']}',
                              color: getHealthColor('tekanan_darah', data['ringkasan']['tekanan_darah']),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: InfoBadge(
                              title: 'Detak Jantung',
                              subtitle: '${data['ringkasan']['detak_jantung']}',
                              color: getHealthColor('detak_jantung', data['ringkasan']['detak_jantung']),
                            ),
                          ),
                        ),
                      ],
                    ).marginOnly(bottom: 24),
                    const Text(
                      'Kemungkinan Masalah',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(
                      color: Colors.grey.withValues(alpha: .5),
                      thickness: 1,
                    ),
                    Text(
                      data['kemungkinan_masalah'],
                      style: TextStyle(fontSize: 13, color: const Color.fromARGB(255, 85, 85, 85)),
                    ).marginOnly(bottom: 12),
                    const Text(
                      'Saran',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(
                      color: Colors.grey.withValues(alpha: .5),
                      thickness: 1,
                    ),
                    Text(
                      data['saran'],
                      style: TextStyle(fontSize: 13, color: const Color.fromARGB(255, 85, 85, 85)),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
