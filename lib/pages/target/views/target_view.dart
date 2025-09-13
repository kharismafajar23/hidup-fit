import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/common/widgets/scrollable_widget.dart';
import 'package:hidup_fit/common/widgets/title_app.dart';
import 'package:hidup_fit/pages/target/controllers/target_controller.dart';
import 'package:hidup_fit/routes/app_routes.dart';
import 'package:hidup_fit/utils/constant/colors.dart';
import 'package:hidup_fit/utils/device/device_utility.dart';
import 'package:hidup_fit/utils/theme/widget_themes/text_styles.dart';

class TargetView extends GetView<TargetController> {
  const TargetView({super.key});
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
                'Lacak Perkembangan Kesehatanmu',
                style: MyTextStyles.headingText.copyWith(color: MyColors.primary, fontSize: 20),
                textAlign: TextAlign.center,
              ).marginOnly(bottom: 2),
              Text(
                'Pantau progress dari target-target yang kamu tetapkan dan raih hidup yang lebih bugar secara konsisten',
                style: MyTextStyles.paragraphText.copyWith(fontSize: 15, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              )
            ],
          ).marginOnly(bottom: 20),
          Text(
            'Masukkan Targetmu',
            style: MyTextStyles.headingText.copyWith(color: MyColors.primary, fontSize: 20),
            textAlign: TextAlign.center,
          ).marginOnly(bottom: 8),
          TextField(),
          TextField(),
          TextField(),
          TextField().marginOnly(bottom: 24),
          SizedBox(
            width: MyDeviceUtils.getScreenWidth(context),
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed(AppRoutes.hasil);
              },
              child: Text('Hasil tracking'),
            ),
          ).marginOnly(bottom: 50),
        ],
      ),
    );
  }
}
