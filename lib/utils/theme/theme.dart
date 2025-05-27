import 'package:flutter/material.dart';
import 'package:hidup_fit/utils/constant/colors.dart';
import 'package:hidup_fit/utils/constant/fonts.dart';
import 'package:hidup_fit/utils/theme/custom_themes/widget_themes/appbar_theme.dart';
import 'package:hidup_fit/utils/theme/custom_themes/widget_themes/bottom_sheet_theme.dart';
import 'package:hidup_fit/utils/theme/custom_themes/widget_themes/checkbox_theme.dart';
import 'package:hidup_fit/utils/theme/custom_themes/widget_themes/chip_theme.dart';
import 'package:hidup_fit/utils/theme/custom_themes/widget_themes/elevated_button_theme.dart';
import 'package:hidup_fit/utils/theme/custom_themes/widget_themes/outlined_button_theme.dart';
import 'package:hidup_fit/utils/theme/custom_themes/widget_themes/text_field_theme.dart';
import 'package:hidup_fit/utils/theme/custom_themes/widget_themes/text_theme.dart';

class CustomAppTheme {
  CustomAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: AppFonts.primaryFont,
    brightness: Brightness.light,
    primaryColor: CustomColors.primary,
    scaffoldBackgroundColor: Color.fromRGBO(233, 226, 242, 1),
    textTheme: CustomTextTheme.lightTextTheme,
    chipTheme: CustomChipTheme.lightChipTheme,
    appBarTheme: CustomAppBarTheme.lightAppBarTheme,
    checkboxTheme: CustomCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: CustomBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: CustomOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: CustomTextFormFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: AppFonts.primaryFont,
    brightness: Brightness.dark,
    primaryColor: CustomColors.primary,
    scaffoldBackgroundColor: Colors.black,
    textTheme: CustomTextTheme.darkTextTheme,
    chipTheme: CustomChipTheme.darkChipTheme,
    appBarTheme: CustomAppBarTheme.darkAppBarTheme,
    checkboxTheme: CustomCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: CustomBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: CustomOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: CustomTextFormFieldTheme.darkInputDecorationTheme,
  );
}
