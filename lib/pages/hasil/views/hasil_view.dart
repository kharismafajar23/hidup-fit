import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/common/widgets/scrollable_widget.dart';
import 'package:hidup_fit/common/widgets/title_app.dart';
import 'package:hidup_fit/pages/hasil/controllers/hasil_controller.dart';
import 'package:hidup_fit/routes/app_routes.dart';
import 'package:hidup_fit/utils/constant/colors.dart';
import 'package:hidup_fit/utils/device/device_utility.dart';
import 'package:hidup_fit/utils/theme/widget_themes/text_styles.dart';

class HasilView extends GetView<HasilController> {
  const HasilView({super.key});
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
                'Hasil Perkembangan Kesehatan',
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Berat Badan', style: MyTextStyles.hasilText),
                            Text('Hari ini: 65.2 Kg', style: MyTextStyles.hasilText),
                            Text('Perubahan: -0.3kg', style: MyTextStyles.hasilText),
                            Text('Status: Stabil', style: MyTextStyles.hasilText),
                            Text('Mencapai Target', style: MyTextStyles.hasilText),
                          ],
                        ),
                        Positioned(right: 0, bottom: 0, child: Icon(Icons.check_circle, color: Colors.green))
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Tekanan Darah', style: MyTextStyles.hasilText),
                            Text('Hari ini: 125/85 mmHg', style: MyTextStyles.hasilText),
                            Text('Status: Normal', style: MyTextStyles.hasilText),
                            Text('Catatan: Jaga pola makan dan cukup tidur', style: MyTextStyles.hasilText),
                          ],
                        ),
                        Positioned(right: 0, bottom: 0, child: Icon(Icons.check_circle, color: Colors.green))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ).marginOnly(bottom: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Langkah Kaki', style: MyTextStyles.hasilText),
                            Text('Total: 1.450 langkah', style: MyTextStyles.hasilText),
                            Text('Target; 1.000 ', style: MyTextStyles.hasilText),
                            Text('Status: Tercapai', style: MyTextStyles.hasilText),
                          ],
                        ),
                        Positioned(right: 0, bottom: 0, child: Icon(Icons.check_circle, color: Colors.green))
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Asupan Air', style: MyTextStyles.hasilText),
                            Text('Total minum: 2 l', style: MyTextStyles.hasilText),
                            Text('Target: 2.5 l', style: MyTextStyles.hasilText),
                            Text('Status Belum Tercapai', style: MyTextStyles.hasilText),
                          ],
                        ),
                        Positioned(right: 0, bottom: 0, child: Icon(Icons.cancel, color: Colors.red))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ).marginOnly(bottom: 80),
          SizedBox(
            width: MyDeviceUtils.getScreenWidth(context),
            child: ElevatedButton(
              onPressed: () {
                Get.offAllNamed(AppRoutes.bottomNavigationMenu);
              },
              child: Text('Kembali ke Beranda'),
            ),
          ),
        ],
      ),
    );
  }
}
