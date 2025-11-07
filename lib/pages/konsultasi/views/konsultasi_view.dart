import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/common/widgets/doctor_card.dart';
import 'package:hidup_fit/common/widgets/scrollable_widget.dart';
import 'package:hidup_fit/common/widgets/title_app.dart';
import 'package:hidup_fit/pages/navigation_menu/controllers/navigation_menu_controller.dart';
import 'package:hidup_fit/utils/device/device_utility.dart';
import 'package:hidup_fit/utils/helpers/maps_helper.dart';
import 'package:hidup_fit/utils/theme/widget_themes/text_styles.dart';

class KonsultasiView extends GetView<NavigationMenuController> {
  const KonsultasiView({super.key});
  @override
  Widget build(BuildContext context) {
    return ScrollableScreen(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleApp().marginOnly(bottom: 20),
          Text(
            'Daftar Rumah Sakit',
            textAlign: TextAlign.center,
            style: MyTextStyles.headingText,
          ).marginOnly(bottom: 16),
          SizedBox(
            width: MyDeviceUtils.getScreenWidth(context),
            height: MyDeviceUtils.getScreenHeight(),
            child: Obx(
              () {
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.rumahSakit.length,
                  itemBuilder: (ctx, i) {
                    final item = controller.rumahSakit[i];
                    return DoctorCard(
                      nama: item.nama,
                      kontak: item.kontak,
                      alamat: item.alamat,
                      linkImage: item.gambar ?? '-',
                      onPressed: () {
                        MapsHelper.openDirections(
                          destinationLat: item.latitude,
                          destinationLng: item.longitude,
                        );
                      },
                    ).marginOnly(bottom: 12);
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
