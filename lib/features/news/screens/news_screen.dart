import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/common/widgets/news_card.dart';
import 'package:hidup_fit/features/news/screens/detail_news_screen.dart';
import 'package:hidup_fit/utils/constant/image_strings.dart';
import 'package:hidup_fit/utils/constant/text_strings.dart';
import 'package:hidup_fit/utils/device/device_utility.dart';
import 'package:hidup_fit/utils/theme/custom_themes/text_styles.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: CustomDeviceUtils.getScreenHeight() - MediaQuery.of(context).padding.top,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        CustomImages.appLogo,
                        height: 50,
                        width: 50,
                        fit: BoxFit.contain,
                      ).marginOnly(right: 12),
                      Text(
                        CustomTexts.appName,
                        style: CustomTextStyles.headingText,
                      )
                    ],
                  ).marginOnly(bottom: 24),
                  Text(
                    'Artikel Pilihan',
                    textAlign: TextAlign.start,
                    style: CustomTextStyles.headingText,
                  ).marginOnly(bottom: 16),
                  Column(
                    spacing: 12,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(DetailNewsScreen());
                        },
                        child: NewsCard(
                          title: '7 Kebiasaan Pagi yang Bikin Tubuh Lebih Sehat dan Produktif',
                          linkImage: 'assets/images/news/news1.jpg',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(DetailNewsScreen());
                        },
                        child: NewsCard(
                          title: 'Kenali Tanda-Tanda Stres dan Cara Mengatasinya',
                          linkImage: 'assets/images/news/news2.jpg',
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
