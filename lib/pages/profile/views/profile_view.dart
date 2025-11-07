import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/common/widgets/scrollable_widget.dart';
import 'package:hidup_fit/common/widgets/title_app.dart';
import 'package:hidup_fit/data/services/db_helper.dart';
import 'package:hidup_fit/pages/navigation_menu/controllers/navigation_menu_controller.dart';
import 'package:hidup_fit/routes/app_routes.dart';
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
          const TitleApp(),
          Center(
            child: Text(
              'Profil Saya',
              textAlign: TextAlign.center,
              style: MyTextStyles.headingText.copyWith(color: MyColors.primary),
            ).marginOnly(bottom: 16),
          ),
          Obx(() {
            final user = controller.user.value;

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/profile.png',
                  width: 80,
                  height: 80,
                ),
                const SizedBox(width: MySizes.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoRow('Nama Lengkap', user['name']),
                      _buildInfoRow('Jenis Kelamin', user['jenis_kelamin']),
                      _buildInfoRow('Tanggal Lahir', user['tanggal_lahir']),
                      _buildInfoRow('Usia', user['usia']),
                    ],
                  ),
                ),
              ],
            ).marginOnly(bottom: 28);
          }),
          _buildButton(
            label: 'Edit Profil',
            onPressed: () => Get.toNamed(AppRoutes.editProfile)?.then((_) {
              controller.loadUser();
            }),
          ),
          _buildButton(
            label: 'Keluar',
            onPressed: () async {
              await DBHelper.instance.resetArticles();
              controller.logout();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: MyTextStyles.paragraphText),
          Flexible(
            child: Text(
              value ?? '-',
              style: MyTextStyles.paragraphText,
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton({required String label, required VoidCallback onPressed}) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 12)),
        child: Text(label, style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 12)),
      ),
    ).marginOnly(bottom: 8);
  }
}
