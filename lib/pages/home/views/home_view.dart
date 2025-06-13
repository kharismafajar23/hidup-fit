import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/common/widgets/scrollable_widget.dart';
import 'package:hidup_fit/common/widgets/title_app.dart';
import 'package:hidup_fit/pages/navigation_menu/controllers/navigation_menu_controller.dart';
import 'package:hidup_fit/utils/constant/colors.dart';
import 'package:hidup_fit/utils/theme/widget_themes/text_styles.dart';

class HomeView extends GetView<NavigationMenuController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return ScrollableScreen(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: TitleApp().marginZero),
              Icon(
                Icons.notifications_none_rounded,
                color: MyColors.primary,
                size: 36,
              )
            ],
          ).marginOnly(bottom: 24),
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: SizedBox(
              height: 200,
              width: double.infinity,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/home.jpg',
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(24),
                      ),
                      child: Container(
                        color: MyColors.white,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          child: Row(
                            children: [
                              Text(
                                'Selamat Datang, ',
                                style: TextStyle(color: MyColors.primary, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                controller.user['name'] ?? '-',
                                style: TextStyle(color: MyColors.primary, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ).marginOnly(bottom: 12),
          Text(
            'Yuk pantau kesehatanmu hari ini!',
            style: MyTextStyles.paragraphText.copyWith(fontStyle: FontStyle.italic),
          ).marginOnly(bottom: 6),
          Row(
            spacing: 8,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: Container(
                    width: double.infinity,
                    height: 80,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/heart.png'),
                        Text(
                          '78 bpm',
                          style: TextStyle(color: Color.fromRGBO(236, 122, 122, 1), fontSize: 12),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: Container(
                    width: double.infinity,
                    height: 80,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/kalori.png').marginOnly(bottom: 4),
                        Text(
                          '350 kcal',
                          style: TextStyle(color: Color.fromRGBO(92, 140, 182, 1), fontSize: 12),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: Container(
                    width: double.infinity,
                    height: 80,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/langkah.png').marginOnly(bottom: 4),
                        Text(
                          '5200 langkah',
                          style: TextStyle(color: Color.fromRGBO(166, 222, 171, 1), fontSize: 10),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: Container(
                    width: double.infinity,
                    height: 80,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/tidur.png').marginOnly(bottom: 4),
                        Text(
                          '7 jam 10 menit',
                          style: TextStyle(color: Color.fromRGBO(196, 170, 110, 1), fontSize: 10),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ).marginOnly(bottom: 18),
          Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Statistics',
                    style: MyTextStyles.paragraphText.copyWith(color: MyColors.darkGrey),
                  ),
                  const Text(
                    'Tren Kesehatan',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ).marginOnly(bottom: 12),
                  SizedBox(
                    height: 210, // Ukuran tetap diperlukan untuk menghindari infinite layout
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: BarChart(
                        BarChartData(
                          gridData: FlGridData(show: false),
                          alignment: BarChartAlignment.spaceAround,
                          maxY: 100,
                          barTouchData: BarTouchData(enabled: true),
                          titlesData: FlTitlesData(
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 90,
                                getTitlesWidget: (value, meta) {
                                  const style = TextStyle(
                                    color: MyColors.darkerGrey,
                                    fontSize: 13,
                                    overflow: TextOverflow.ellipsis,
                                  );
                                  final labels = [
                                    'Jantung',
                                    'Fisik',
                                    'Badan',
                                    'Tidur',
                                  ];
                                  if (value.toInt() >= 0 && value.toInt() < labels.length) {
                                    return RotatedBox(
                                      quarterTurns: -1,
                                      child: Text(labels[value.toInt()], style: style),
                                    );
                                  } else {
                                    return const SizedBox.shrink();
                                  }
                                },
                              ),
                            ),
                            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            rightTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 40,
                                interval: 25,
                                getTitlesWidget: (value, meta) {
                                  if (value % 25 == 0) {
                                    return RotatedBox(
                                      quarterTurns: 3,
                                      child: Text(
                                        '${value.toInt()}',
                                        style: const TextStyle(
                                          color: MyColors.darkerGrey,
                                          fontSize: 13,
                                        ),
                                      ),
                                    );
                                  } else {
                                    return const SizedBox.shrink();
                                  }
                                },
                              ),
                            ),
                          ),
                          borderData: FlBorderData(show: false),
                          barGroups: [
                            BarChartGroupData(x: 0, barRods: [
                              BarChartRodData(toY: 100, width: 16, color: Color.fromRGBO(74, 58, 255, 1))
                            ]),
                            BarChartGroupData(x: 1, barRods: [
                              BarChartRodData(toY: 60, width: 16, color: Color.fromRGBO(224, 198, 253, 1))
                            ]),
                            BarChartGroupData(x: 2, barRods: [
                              BarChartRodData(toY: 50, width: 16, color: Color.fromRGBO(150, 45, 255, 1))
                            ]),
                            BarChartGroupData(x: 3, barRods: [
                              BarChartRodData(toY: 25, width: 16, color: Color.fromRGBO(198, 210, 253, 1))
                            ]),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
