import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/common/widgets/scrollable_widget.dart';
import 'package:hidup_fit/common/widgets/title_app.dart';
import 'package:hidup_fit/data/services/format_tanggal.dart';
import 'package:hidup_fit/pages/riwayat_kesehatan/controllers/riwayat_kesehatan_controller.dart';
import 'package:hidup_fit/routes/app_routes.dart';
import 'package:hidup_fit/utils/constant/colors.dart';
import 'package:hidup_fit/utils/device/device_utility.dart';
import 'package:hidup_fit/utils/theme/widget_themes/text_styles.dart';

class RiwayatKesehatanView extends GetView<RiwayatKesehatanController> {
  const RiwayatKesehatanView({super.key});
  @override
  Widget build(BuildContext context) {
    return ScrollableScreen(
      child: Column(
        children: [
          TitleApp().marginOnly(bottom: 24),
          Text(
            'Riwayat kesehatan',
            style: MyTextStyles.headingText,
          ).marginOnly(bottom: 24),
          SizedBox(
            width: MyDeviceUtils.getScreenWidth(context),
            height: MyDeviceUtils.getScreenHeight(),
            child: Obx(
              () {
                return ListView.builder(
                  itemCount: controller.daftarRiwayatKesehatan.length,
                  itemBuilder: (ctx, i) {
                    final riwayat = controller.daftarRiwayatKesehatan[i];
                    return GestureDetector(
                      onTap: () {
                        var argument = {
                          'type': 'detail',
                          'id_riwayat': riwayat['id']
                        };
                        Get.toNamed(AppRoutes.statistikKesehatan, arguments: argument);
                      },
                      child: Card(
                        color: MyColors.accent,
                        child: ListTile(
                          leading: Container(
                            width: 42,
                            height: 42,
                            decoration: BoxDecoration(
                              color: MyColors.buttonPrimary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                (i + 1).toString(),
                                style: TextStyle(color: Colors.white70, fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          title: Text(formatTanggal(riwayat['tanggal'])),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
