import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/common/widgets/back_button.dart';
import 'package:hidup_fit/common/widgets/scrollable_widget.dart';
import 'package:hidup_fit/utils/constant/colors.dart';

import '../controllers/detail_article_controller.dart';

class DetailArticleView extends GetView<DetailArticleController> {
  const DetailArticleView({super.key});
  @override
  Widget build(BuildContext context) {
    return ScrollableScreen(
      child: Column(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  Image.asset(
                    controller.arguments.imageUrl,
                    height: 270,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                    child: Column(
                      children: [
                        Text(
                          controller.arguments.title,
                          style: TextStyle(
                            color: MyColors.textPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ).marginOnly(bottom: 20),
                        Text(
                          controller.arguments.description,
                          style: TextStyle(color: MyColors.textPrimary, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                left: 26,
                top: 26,
                child: CustomBackButton(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
