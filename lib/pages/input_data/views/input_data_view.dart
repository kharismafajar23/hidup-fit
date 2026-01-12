import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/common/widgets/scrollable_widget.dart';
import 'package:hidup_fit/common/widgets/title_app.dart';
import 'package:hidup_fit/routes/app_routes.dart';
import 'package:hidup_fit/utils/constant/colors.dart';
import 'package:hidup_fit/utils/theme/widget_themes/text_styles.dart';

import '../controllers/input_data_controller.dart';

class InputDataView extends GetView<InputDataController> {
  const InputDataView({super.key});
  @override
  Widget build(BuildContext context) {
    return ScrollableScreen(
      child: Column(
        children: [
          TitleApp().marginOnly(bottom: 24),
          Card(
            color: MyColors.accent,
            child: ListTile(
              leading: Image.asset('assets/images/chart.png'),
              title: Text(
                'Pantau Kesehatanmu',
                style: MyTextStyles.headingText.copyWith(fontSize: 20),
              ),
              subtitle: ElevatedButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.statistikKesehatan, arguments: {
                    'type': 'cek'
                  });
                },
                style: ElevatedButton.styleFrom(
                  side: BorderSide(color: MyColors.gold),
                  backgroundColor: MyColors.gold,
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
                child: Text('Cek Disini'),
              ),
            ),
          ).marginOnly(bottom: 12),
          Card(
            color: MyColors.primary,
            child: ListTile(
              onTap: () {
                Get.toNamed(AppRoutes.formKesehatan);
              },
              leading: Icon(
                Icons.add_circle,
                size: 32,
                color: MyColors.textPrimary,
              ),
              title: Text(
                'Input Data Kesehatanmu',
                style: MyTextStyles.headingText.copyWith(fontSize: 24),
              ),
            ),
          ).marginOnly(bottom: 12),
          Card(
            color: MyColors.accent,
            child: ListTile(
              onTap: () {
                Get.toNamed(AppRoutes.screeningEntry);
              },
              leading: Icon(
                Icons.person_search_rounded,
                size: 32,
              ),
              title: Text('Screening kesehatan'),
            ),
          ),
          Card(
            color: MyColors.accent,
            child: ListTile(
              onTap: () {
                Get.toNamed(AppRoutes.riwayatKesehatan);
              },
              leading: Icon(
                Icons.history_rounded,
                size: 32,
              ),
              title: Text('Lihat riwayat kesehatan'),
            ),
          )
        ],
      ),
    );
  }
}
