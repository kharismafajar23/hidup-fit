import 'package:flutter/material.dart';
import 'package:hidup_fit/utils/constant/colors.dart';
import 'package:hidup_fit/utils/constant/sizes.dart';

class CustomTextFormFieldTheme {
  CustomTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: CustomColors.darkGrey,
    suffixIconColor: CustomColors.darkGrey,
    constraints: const BoxConstraints.expand(height: CustomSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(fontSize: CustomSizes.fontSizeMd, color: CustomColors.textPrimary),
    hintStyle: const TextStyle().copyWith(fontSize: CustomSizes.fontSizeSm, color: CustomColors.textPrimary),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: CustomColors.textPrimary.withOpacity(0.8)),
    filled: true,
    fillColor: Colors.white,
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CustomSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 3, color: CustomColors.primary),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CustomSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 3, color: CustomColors.primary),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CustomSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 3, color: CustomColors.primary),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CustomSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 3, color: CustomColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CustomSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 3, color: CustomColors.warning),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: CustomColors.darkGrey,
    suffixIconColor: CustomColors.darkGrey,
    constraints: const BoxConstraints.expand(height: CustomSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(fontSize: CustomSizes.fontSizeMd, color: CustomColors.white),
    hintStyle: const TextStyle().copyWith(fontSize: CustomSizes.fontSizeSm, color: CustomColors.white),
    floatingLabelStyle: const TextStyle().copyWith(color: CustomColors.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CustomSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 3, color: CustomColors.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CustomSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 3, color: CustomColors.darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CustomSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 3, color: CustomColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CustomSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 3, color: CustomColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CustomSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 3, color: CustomColors.warning),
    ),
  );
}
