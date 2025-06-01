import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/utils/constant/image_strings.dart';
import 'package:hidup_fit/utils/constant/text_strings.dart';
import 'package:hidup_fit/utils/theme/custom_themes/text_styles.dart';

class LogoWithText extends StatelessWidget {
  const LogoWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    ).marginOnly(bottom: 24);
  }
}
