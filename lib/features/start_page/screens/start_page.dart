import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/features/authentication/screens/login.dart';
import 'package:hidup_fit/features/start_page/controllers/start_page_controller.dart';
import 'package:hidup_fit/utils/constant/image_strings.dart';
import 'package:hidup_fit/utils/constant/text_strings.dart';
import 'package:hidup_fit/utils/device/device_utility.dart';
import 'package:hidup_fit/utils/theme/custom_themes/text_styles.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StartPageController());

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                CustomImages.appLogo,
                height: 150,
                width: 150,
                fit: BoxFit.contain,
              ),
              Text(
                CustomTexts.appName,
                style: CustomTextStyles.headingText,
              ),
              SizedBox(height: 40),
              SizedBox(
                width: CustomDeviceUtils.getScreenWidth(context) * 3 / 5,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(Login());
                  },
                  child: Text(CustomTexts.mulai),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
