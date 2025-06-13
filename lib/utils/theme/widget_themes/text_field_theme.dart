import 'package:flutter/material.dart';
import 'package:hidup_fit/utils/constant/colors.dart';
import 'package:hidup_fit/utils/constant/sizes.dart';

class MyTextFormFieldTheme {
  MyTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: MyColors.darkGrey,
    suffixIconColor: MyColors.darkGrey,
    constraints: const BoxConstraints.expand(height: MySizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(fontSize: MySizes.fontSizeMd, color: MyColors.primary, fontStyle: FontStyle.italic),
    hintStyle: const TextStyle().copyWith(fontSize: MySizes.fontSizeSm, color: MyColors.textPrimary),
    helperStyle: TextStyle().copyWith(color: MyColors.primary, fontStyle: FontStyle.italic),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: MyColors.textPrimary.withOpacity(0.8)),
    filled: true,
    fillColor: Colors.white,
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MySizes.inputFieldRadius),
      borderSide: const BorderSide(width: 3, color: MyColors.primary),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MySizes.inputFieldRadius),
      borderSide: const BorderSide(width: 3, color: MyColors.primary),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MySizes.inputFieldRadius),
      borderSide: const BorderSide(width: 3, color: MyColors.primary),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MySizes.inputFieldRadius),
      borderSide: const BorderSide(width: 3, color: MyColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MySizes.inputFieldRadius),
      borderSide: const BorderSide(width: 3, color: MyColors.warning),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: MyColors.darkGrey,
    suffixIconColor: MyColors.darkGrey,
    constraints: const BoxConstraints.expand(height: MySizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(fontSize: MySizes.fontSizeMd, color: MyColors.white),
    hintStyle: const TextStyle().copyWith(fontSize: MySizes.fontSizeSm, color: MyColors.white),
    floatingLabelStyle: const TextStyle().copyWith(color: MyColors.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MySizes.inputFieldRadius),
      borderSide: const BorderSide(width: 3, color: MyColors.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MySizes.inputFieldRadius),
      borderSide: const BorderSide(width: 3, color: MyColors.darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MySizes.inputFieldRadius),
      borderSide: const BorderSide(width: 3, color: MyColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MySizes.inputFieldRadius),
      borderSide: const BorderSide(width: 3, color: MyColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MySizes.inputFieldRadius),
      borderSide: const BorderSide(width: 3, color: MyColors.warning),
    ),
  );
}
