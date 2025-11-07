import 'package:flutter/material.dart';
import 'package:hidup_fit/utils/constant/colors.dart';

class InfoItem extends StatelessWidget {
  final Widget leading;
  final String title;
  final String subtitle;

  const InfoItem({
    super.key,
    required this.leading,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        leading,
        const SizedBox(width: 4),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: MyColors.primary,
                ),
              ),
              Text(
                subtitle,
                softWrap: true,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
