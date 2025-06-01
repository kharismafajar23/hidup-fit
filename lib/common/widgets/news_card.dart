import 'package:flutter/material.dart';
import 'package:hidup_fit/utils/theme/custom_themes/text_styles.dart';

class NewsCard extends StatelessWidget {
  final String title, linkImage;

  const NewsCard({
    super.key,
    required this.title,
    required this.linkImage,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Image.asset(
              linkImage,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              child: Text(
                title,
                style: CustomTextStyles.paragraphText,
              ),
            )
          ],
        ),
      ),
    );
  }
}
