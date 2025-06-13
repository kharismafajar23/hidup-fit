import 'package:flutter/material.dart';
import 'package:hidup_fit/utils/constant/colors.dart';
import 'package:hidup_fit/utils/constant/fonts.dart';

class MyTextStyles {
  MyTextStyles._();

  static const TextStyle headingText = TextStyle(
    fontSize: 24,
    fontFamily: AppFonts.primaryFont,
    fontWeight: FontWeight.w700,
    color: Color.fromRGBO(15, 51, 83, 1),
  );

  static const TextStyle paragraphText = TextStyle(
    fontSize: 16,
    fontFamily: AppFonts.primaryFont,
    fontWeight: FontWeight.w500,
    color: Color.fromRGBO(166, 172, 222, 1),
  );

  static const TextStyle labelText = TextStyle(
    fontSize: 16,
    fontFamily: AppFonts.primaryFont,
    fontWeight: FontWeight.w500,
    color: MyColors.primary,
  );

  static const TextStyle hasilText = TextStyle(
    fontSize: 14,
    fontFamily: AppFonts.primaryFont,
    fontWeight: FontWeight.w500,
    color: MyColors.accent,
    fontStyle: FontStyle.italic,
  );
}
