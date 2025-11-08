import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/utils/constant/colors.dart';

class InfoBadge extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;

  const InfoBadge({
    super.key,
    required this.title,
    required this.subtitle,
    this.color = Colors.blueGrey,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: MyColors.primary,
              ),
            ).marginOnly(bottom: 2),
            Badge(
              backgroundColor: color,
              label: Text(
                subtitle,
                softWrap: true,
                style: const TextStyle(fontSize: 12),
              ),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            ),
          ],
        ),
      ],
    );
  }
}
