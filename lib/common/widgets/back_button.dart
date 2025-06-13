import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/utils/constant/colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Get.back,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: Container(
          height: 40,
          width: 40,
          color: MyColors.primary,
          child: Icon(Icons.arrow_back, color: MyColors.white),
        ),
      ),
    );
  }
}
