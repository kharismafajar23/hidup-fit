import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/common/widgets/scrollable_widget.dart';
import 'package:hidup_fit/common/widgets/title_app.dart';
import 'package:hidup_fit/pages/navigation_menu/controllers/navigation_menu_controller.dart';
import 'package:hidup_fit/utils/constant/colors.dart';
import 'package:hidup_fit/utils/constant/sizes.dart';
import 'package:hidup_fit/utils/theme/widget_themes/text_styles.dart';

class ProfileView extends GetView<NavigationMenuController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return ScrollableScreen(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleApp(),
          Center(
            child: Text(
              'Profil Saya',
              textAlign: TextAlign.center,
              style: MyTextStyles.headingText.copyWith(color: MyColors.primary),
            ).marginOnly(bottom: 16),
          ),
          Row(
            spacing: MySizes.md,
            children: [
              Image.asset(
                'assets/images/profile.png',
                width: 80,
                height: 80,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nama Lengkap',
                    style: MyTextStyles.paragraphText,
                  ),
                  Text(
                    'Jenis Kelamin',
                    style: MyTextStyles.paragraphText,
                  ),
                  Text(
                    'Tanggal Lahir',
                    style: MyTextStyles.paragraphText,
                  ),
                  Text(
                    'Usia',
                    style: MyTextStyles.paragraphText,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.user['name'] ?? '-',
                    style: MyTextStyles.paragraphText,
                  ),
                  Text(
                    controller.user['jenis_kelamin'] ?? '-',
                    style: MyTextStyles.paragraphText,
                  ),
                  Text(
                    controller.user['tanggal_lahir'] ?? '-',
                    style: MyTextStyles.paragraphText,
                  ),
                  Text(
                    controller.user['usia'] ?? '-',
                    style: MyTextStyles.paragraphText,
                  ),
                ],
              )
            ],
          ).marginOnly(bottom: 28),
          Text(
            'Akun & Keamanan',
            textAlign: TextAlign.start,
            style: MyTextStyles.headingText.copyWith(color: MyColors.primary),
          ).marginOnly(bottom: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: MyTextStyles.paragraphText,
                  ),
                  Text(
                    'Nomor HP',
                    style: MyTextStyles.paragraphText,
                  ),
                  Text(
                    'Ubah Kata Sandi',
                    style: MyTextStyles.paragraphText,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.user['email'] ?? '-',
                    style: MyTextStyles.paragraphText,
                  ),
                  Text(
                    controller.user['no_hp'] ?? '-',
                    style: MyTextStyles.paragraphText,
                  ),
                ],
              )
            ],
          ).marginOnly(bottom: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
                child: Text(
                  'Edit Profil',
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12),
                )),
          ).marginOnly(bottom: 5),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  controller.logout();
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
                child: Text(
                  'Keluar',
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12),
                )),
          ).marginOnly(bottom: 5),
        ],
      ),
    );
  }
}
