import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/utils/constant/sizes.dart';
import 'package:hidup_fit/utils/device/device_utility.dart';
import 'package:hidup_fit/utils/theme/custom_themes/text_styles.dart';

class FormInputDate extends StatelessWidget {
  final String label;
  final bool isPassword, enabled;

  const FormInputDate({
    super.key,
    required this.label,
    this.isPassword = false,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: CustomDeviceUtils.getScreenWidth(context),
          child: Text(
            label,
            style: CustomTextStyles.paragraphText.copyWith(fontSize: CustomSizes.fontSizeSm),
            textAlign: TextAlign.start,
          ),
        ).marginOnly(bottom: 4),
        TextField(
          keyboardType: TextInputType.text,
          obscureText: isPassword,
          enabled: enabled,
          decoration: InputDecoration(suffixIcon: Icon(Icons.calendar_month_rounded)),
        ).marginOnly(bottom: 16),
      ],
    );
  }
}
