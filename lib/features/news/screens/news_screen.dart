import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/utils/constant/image_strings.dart';
import 'package:hidup_fit/utils/constant/text_strings.dart';
import 'package:hidup_fit/utils/device/device_utility.dart';
import 'package:hidup_fit/utils/theme/custom_themes/text_styles.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: CustomDeviceUtils.getScreenHeight() - MediaQuery.of(context).padding.top,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        CustomImages.appLogo,
                        height: 50,
                        width: 50,
                        fit: BoxFit.contain,
                      ).marginOnly(right: 12),
                      Text(
                        CustomTexts.appName,
                        style: CustomTextStyles.headingText,
                      )
                    ],
                  ).marginOnly(bottom: 24),
                  Text(
                    'Artikel Pilihan',
                    textAlign: TextAlign.start,
                    style: CustomTextStyles.headingText,
                  ).marginOnly(bottom: 38),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
