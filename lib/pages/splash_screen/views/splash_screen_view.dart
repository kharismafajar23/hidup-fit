import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/routes/app_routes.dart';
import 'package:hidup_fit/utils/constant/image_strings.dart';
import 'package:hidup_fit/utils/constant/text_strings.dart';
import 'package:hidup_fit/utils/device/device_utility.dart';
import 'package:hidup_fit/utils/theme/widget_themes/text_styles.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
              ),
              SizedBox(height: 40),
              SizedBox(
                width: MyDeviceUtils.getScreenWidth(context) * 3 / 5,
                child: ElevatedButton(
                  onPressed: () {
                    Get.offNamed(AppRoutes.login);
                  },
                  child: Text('Mulai'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
