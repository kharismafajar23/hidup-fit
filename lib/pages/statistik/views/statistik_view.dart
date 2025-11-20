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

          // ================= DATA KESEHATAN =================
          Obx(() {
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
                      subtitle: formatTanggal(
                        controller.dataKesehatan['tanggal']?.toString() ?? '-',
                      ),
                    ).marginOnly(bottom: 8),

                    // --- Row 1 ---
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: InfoItem(
                          leading: const Icon(Icons.accessibility_new_sharp),
                          title: 'Usia',
                          subtitle: '${controller.user['usia'] ?? '-'} tahun',
                        )),
                        Expanded(
                          child: InfoItem(
                            leading: const Icon(Icons.waves_rounded),
                            title: 'Laju Pernafasan',
                            subtitle: '${controller.dataKesehatan['lajuPernafasan'] ?? '-'} / menit',
                          ),
                        ),
                        Expanded(
                            child: Text(
                          '-',
                          style: TextStyle(color: Colors.white),
                        )),
                      ],
                    ).marginOnly(bottom: 8),

                    // --- Row 2 ---
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
                            title: 'Denyut Nadi',
                            subtitle: '${controller.dataKesehatan['detakJantung'] ?? '-'} bpm',
                          ),
                        ),
                      ],
                    ).marginOnly(bottom: 8),

                    // --- Row 3 ---
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
          }).marginOnly(bottom: 24),

          // ================= HASIL ANALISA =================
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

            // Ambil semua nilai ringkasan untuk perhitungan kondisi_kesehatan
            final ringkasan = Map<String, String>.from(data['ringkasan'] ?? {});
            final kondisiText = getKondisiKesehatan(ringkasan);
            final kondisiColor = getHealthColor(
              'kondisi_kesehatan',
              kondisiText,
              allValues: ringkasan,
            );

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
                      color: Colors.grey.withOpacity(0.5),
                      thickness: 1,
                    ).marginOnly(bottom: 4),

                    // Kondisi + Berat Badan
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: InfoBadge(
                              title: 'Kondisi',
                              subtitle: kondisiText,
                              color: kondisiColor,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: InfoBadge(
                              title: 'Berat Badan',
                              subtitle: '${ringkasan['berat_badan']}',
                              color: getHealthColor(
                                'berat_badan',
                                ringkasan['berat_badan'] ?? '',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ).marginOnly(bottom: 8),

                    // Tekanan Darah + Denyut Nadi
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: InfoBadge(
                              title: 'Tekanan Darah',
                              subtitle: '${ringkasan['tekanan_darah']}',
                              color: getHealthColor(
                                'tekanan_darah',
                                ringkasan['tekanan_darah'] ?? '',
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: InfoBadge(
                              title: 'Denyut Nadi',
                              subtitle: '${ringkasan['detak_jantung']}',
                              color: getHealthColor(
                                'detak_jantung',
                                ringkasan['detak_jantung'] ?? '',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ).marginOnly(bottom: 8),

                    // Suhu Tubuh + Jumlah Langkah
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: InfoBadge(
                              title: 'Suhu Tubuh',
                              subtitle: '${ringkasan['suhu_tubuh']}',
                              color: getHealthColor(
                                'suhu_tubuh',
                                ringkasan['suhu_tubuh'] ?? '',
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: InfoBadge(
                              title: 'Jumlah Langkah',
                              subtitle: '${ringkasan['langkah']}',
                              color: getHealthColor(
                                'langkah',
                                ringkasan['langkah'] ?? '',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ).marginOnly(bottom: 8),

                    // Laju Pernafasan
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: InfoBadge(
                              title: 'Laju Pernafasan',
                              subtitle: '${ringkasan['laju_pernafasan']}',
                              color: getHealthColor(
                                'laju_pernafasan',
                                ringkasan['laju_pernafasan'] ?? '',
                              ),
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
                      color: Colors.grey.withOpacity(0.5),
                      thickness: 1,
                    ),
                    Text(
                      data['kemungkinan_masalah'],
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color.fromARGB(255, 85, 85, 85),
                      ),
                    ).marginOnly(bottom: 12),

                    const Text(
                      'Saran',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(
                      color: Colors.grey.withOpacity(0.5),
                      thickness: 1,
                    ),
                    Text(
                      data['saran'],
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color.fromARGB(255, 85, 85, 85),
                      ),
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
