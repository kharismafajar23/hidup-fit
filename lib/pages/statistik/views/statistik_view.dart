import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/common/widgets/scrollable_widget.dart';
import 'package:hidup_fit/common/widgets/title_app.dart';
import 'package:hidup_fit/routes/app_routes.dart';
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
                style: MyTextStyles.headingText.copyWith(color: MyColors.primary, fontSize: 20),
                textAlign: TextAlign.center,
              ).marginOnly(bottom: 2),
              Text(
                'Lihat perkembangan kondisi tubuh dari waktu ke waktu dan temukan pola kesehatanmu secara otomatis',
                style: MyTextStyles.paragraphText.copyWith(fontSize: 15, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              )
            ],
          ).marginOnly(bottom: 20),
          Container(
            width: MyDeviceUtils.getScreenWidth(context),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Statistics',
                    style: MyTextStyles.paragraphText.copyWith(color: MyColors.darkGrey),
                  ),
                  Text(
                    'Kesehatanmu',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ).marginOnly(bottom: 4),
                  Divider(
                    color: Colors.grey.withOpacity(0.5),
                    thickness: 1,
                  ).marginOnly(bottom: 4),
                  Row(
                    spacing: 12,
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: PieChart(
                              PieChartData(
                                sections: [
                                  PieChartSectionData(
                                    showTitle: false,
                                    color: Color.fromRGBO(74, 58, 255, 1),
                                    value: 40,
                                    radius: 60,
                                  ),
                                  PieChartSectionData(
                                    showTitle: false,
                                    color: Color.fromRGBO(45, 91, 255, 1),
                                    value: 20,
                                    radius: 60,
                                  ),
                                  PieChartSectionData(
                                    showTitle: false,
                                    color: Color.fromRGBO(147, 170, 253, 1),
                                    value: 20,
                                    radius: 60,
                                  ),
                                  PieChartSectionData(
                                    showTitle: false,
                                    color: Color.fromRGBO(198, 210, 253, 1),
                                    value: 10,
                                    radius: 60,
                                  ),
                                  PieChartSectionData(
                                    showTitle: false,
                                    color: Color.fromRGBO(229, 234, 252, 1),
                                    value: 10,
                                    radius: 60,
                                  ),
                                ],
                                sectionsSpace: 0,
                                centerSpaceRadius: 0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          spacing: 12,
                          children: [
                            Column(
                              spacing: 8,
                              children: [
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/icons/heart.png',
                                        height: 40,
                                        width: 32,
                                      ),
                                      Text(
                                        '78 bpm',
                                        style: TextStyle(color: Color.fromRGBO(236, 122, 122, 1), fontSize: 12),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/icons/langkah.png',
                                        height: 40,
                                        width: 32,
                                      ).marginOnly(bottom: 4),
                                      Text(
                                        '5200 langkah',
                                        style: TextStyle(color: Color.fromRGBO(166, 222, 171, 1), fontSize: 10),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Column(
                              spacing: 8,
                              children: [
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/icons/kalori.png',
                                        height: 40,
                                        width: 32,
                                      ).marginOnly(bottom: 4),
                                      Text(
                                        '350 kcal',
                                        style: TextStyle(color: Color.fromRGBO(92, 140, 182, 1), fontSize: 12),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/icons/tidur.png',
                                        height: 40,
                                        width: 32,
                                        fit: BoxFit.contain,
                                      ).marginOnly(bottom: 4),
                                      Text(
                                        '7 jam 10 menit',
                                        style: TextStyle(color: Color.fromRGBO(196, 170, 110, 1), fontSize: 10),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ).marginOnly(bottom: 24),
          Text(
            'Ringkasan Kesehatan',
            style: MyTextStyles.headingText.copyWith(color: MyColors.primary, fontSize: 20),
          ).marginOnly(bottom: 2),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Text(
                '-',
                style: MyTextStyles.paragraphText.copyWith(fontSize: 15, fontStyle: FontStyle.italic),
              ),
              Expanded(
                child: Text(
                  'Rata-rata detak jantung minggu ini: 78 bpm',
                  style: MyTextStyles.paragraphText.copyWith(fontSize: 15, fontStyle: FontStyle.italic),
                ),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Text(
                '-',
                style: MyTextStyles.paragraphText.copyWith(fontSize: 15, fontStyle: FontStyle.italic),
              ),
              Expanded(
                child: Text(
                  'Tekanan darah stabil dalam rentang 5 hari terakhir',
                  style: MyTextStyles.paragraphText.copyWith(fontSize: 15, fontStyle: FontStyle.italic),
                ),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Text(
                '-',
                style: MyTextStyles.paragraphText.copyWith(fontSize: 15, fontStyle: FontStyle.italic),
              ),
              Expanded(
                child: Text(
                  'Berat badan naik 0.5 kg dari minggu lalu',
                  style: MyTextStyles.paragraphText.copyWith(fontSize: 15, fontStyle: FontStyle.italic),
                ),
              )
            ],
          ).marginOnly(bottom: 40),
        ],
      ),
    );
  }
}
