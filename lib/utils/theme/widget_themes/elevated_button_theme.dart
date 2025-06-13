import 'package:flutter/material.dart';
import 'package:hidup_fit/utils/constant/colors.dart';
import 'package:hidup_fit/utils/constant/fonts.dart';
import 'package:hidup_fit/utils/constant/sizes.dart';

/* -- Light & Dark Elevated Button Themes -- */
class MyElevatedButtonTheme {
  MyElevatedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: MyColors.light,
      backgroundColor: MyColors.primary,
      disabledForegroundColor: MyColors.darkGrey,
      disabledBackgroundColor: MyColors.buttonDisabled,
      side: const BorderSide(color: MyColors.primary),
      padding: const EdgeInsets.symmetric(vertical: MySizes.buttonHeight),
      textStyle: const TextStyle(fontSize: 16, color: MyColors.textWhite, fontWeight: FontWeight.w600, fontFamily: AppFonts.primaryFont),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(MySizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: MyColors.light,
      backgroundColor: MyColors.primary,
      disabledForegroundColor: MyColors.darkGrey,
      disabledBackgroundColor: MyColors.darkerGrey,
      side: const BorderSide(color: MyColors.primary),
      padding: const EdgeInsets.symmetric(vertical: MySizes.buttonHeight),
      textStyle: const TextStyle(fontSize: 16, color: MyColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(MySizes.buttonRadius)),
    ),
  );
}
