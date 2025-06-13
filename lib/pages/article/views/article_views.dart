import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/common/widgets/news_card.dart';
import 'package:hidup_fit/common/widgets/scrollable_widget.dart';
import 'package:hidup_fit/common/widgets/title_app.dart';
import 'package:hidup_fit/pages/navigation_menu/controllers/navigation_menu_controller.dart';
import 'package:hidup_fit/routes/app_routes.dart';
import 'package:hidup_fit/utils/device/device_utility.dart';

class ArticleViews extends GetView<NavigationMenuController> {
  const ArticleViews({super.key});
  @override
  Widget build(BuildContext context) {
    return ScrollableScreen(
      child: Column(
        children: [
          TitleApp().marginOnly(bottom: 24),
          SizedBox(
            width: MyDeviceUtils.getScreenWidth(context),
            height: MyDeviceUtils.getScreenHeight(),
            child: Obx(
              () {
                return ListView.builder(
                  itemCount: controller.articles.length,
                  itemBuilder: (ctx, i) {
                    final article = controller.articles[i];
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.articleDetail, arguments: article);
                      },
                      child: Column(
                        children: [
                          NewsCard(title: article.title, linkImage: article.imageUrl).marginOnly(bottom: 16)
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
