import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/common/widgets/scrollable_widget.dart';
import 'package:hidup_fit/routes/app_routes.dart';
import 'package:hidup_fit/utils/constant/colors.dart';
import 'package:hidup_fit/utils/constant/image_strings.dart';
import 'package:hidup_fit/utils/constant/text_strings.dart';
import 'package:hidup_fit/utils/device/device_utility.dart';
import 'package:hidup_fit/utils/theme/widget_themes/text_styles.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return ScrollableScreen(
      child: Column(
        children: [
          Image.asset(
            MyImages.appLogo,
            height: 150,
            width: 150,
            fit: BoxFit.contain,
          ),
          Text(
            MyTexts.appName,
            style: MyTextStyles.headingText,
          ).marginOnly(bottom: 38),
          Text(
            'Login',
            style: MyTextStyles.paragraphText.copyWith(fontSize: 24, fontWeight: FontWeight.bold),
          ).marginOnly(bottom: 20),
          SizedBox(
            width: MyDeviceUtils.getScreenWidth(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Masukkan Username', style: MyTextStyles.labelText).marginOnly(bottom: 4),
                TextField(
                  controller: controller.usernameController,
                  decoration: InputDecoration(hintText: 'Masukan username di sini...', hintStyle: TextStyle(fontWeight: FontWeight.normal)),
                  autofocus: true,
                ).marginOnly(bottom: 16),
                Text('Masukkan Kata Sandi', style: MyTextStyles.labelText).marginOnly(bottom: 4),
                TextField(
                  controller: controller.passwordController,
                  decoration: InputDecoration(hintText: 'Masukan password di sini...', hintStyle: TextStyle(fontWeight: FontWeight.normal)),
                  obscureText: true,
                ).marginOnly(bottom: 16),
                SizedBox(
                  width: MyDeviceUtils.getScreenWidth(context),
                  child: ElevatedButton(
                    onPressed: () {
                      controller.loginClick();
                    },
                    child: Text('Masuk'),
                  ),
                ).marginOnly(bottom: 20),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Belum Punya Akun?', style: TextStyle(color: MyColors.primary)).marginOnly(right: 8),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.register);
                },
                child: Text('Daftar Sekarang', style: TextStyle(color: MyColors.primary, fontWeight: FontWeight.bold)),
              )
            ],
          )
        ],
      ),
    );
  }
}
