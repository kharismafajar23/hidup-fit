import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:hidup_fit/utils/constant/image_strings.dart';
import 'package:hidup_fit/utils/constant/text_strings.dart';
import 'package:hidup_fit/utils/theme/widget_themes/text_styles.dart';

class TitleApp extends StatelessWidget {
  const TitleApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Image.asset(
          MyImages.appLogo,
          width: 48,
          height: 48,
        ),
        Text(
          MyTexts.appName,
          style: MyTextStyles.headingText,
        ),
      ],
    );
  }
}
