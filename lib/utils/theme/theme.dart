import 'package:flutter/material.dart';
import 'package:hidup_fit/utils/constant/colors.dart';
import 'package:hidup_fit/utils/constant/fonts.dart';
import 'package:hidup_fit/utils/theme/widget_themes/appbar_theme.dart';
import 'package:hidup_fit/utils/theme/widget_themes/bottom_sheet_theme.dart';
import 'package:hidup_fit/utils/theme/widget_themes/checkbox_theme.dart';
import 'package:hidup_fit/utils/theme/widget_themes/chip_theme.dart';
import 'package:hidup_fit/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:hidup_fit/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:hidup_fit/utils/theme/widget_themes/text_field_theme.dart';
import 'package:hidup_fit/utils/theme/widget_themes/text_theme.dart';

class MyAppTheme {
  MyAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: AppFonts.primaryFont,
    brightness: Brightness.light,
    primaryColor: MyColors.primary,
    scaffoldBackgroundColor: Color.fromRGBO(233, 226, 242, 1),
    textTheme: MyTextTheme.lightTextTheme,
    chipTheme: MyChipTheme.lightChipTheme,
    appBarTheme: MyAppBarTheme.lightAppBarTheme,
    checkboxTheme: MyCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: MyBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: MyElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: MyOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: MyTextFormFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: AppFonts.primaryFont,
    brightness: Brightness.dark,
    primaryColor: MyColors.primary,
    scaffoldBackgroundColor: Colors.black,
    textTheme: MyTextTheme.darkTextTheme,
    chipTheme: MyChipTheme.darkChipTheme,
    appBarTheme: MyAppBarTheme.darkAppBarTheme,
    checkboxTheme: MyCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: MyBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: MyElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: MyOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: MyTextFormFieldTheme.darkInputDecorationTheme,
  );
}
