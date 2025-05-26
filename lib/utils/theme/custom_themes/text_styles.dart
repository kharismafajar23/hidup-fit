import 'package:flutter/material.dart';
import 'package:hidup_fit/utils/constant/fonts.dart';

class CustomTextStyles {
  CustomTextStyles._();

  static const TextStyle headingText = TextStyle(
    fontSize: 24,
    fontFamily: AppFonts.primaryFont,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle paragraphText = TextStyle(
    fontSize: 16,
    fontFamily: AppFonts.primaryFont,
    fontWeight: FontWeight.w500,
  );
}
