import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/utils/constant/colors.dart';
import 'package:hidup_fit/utils/constant/sizes.dart';

class DoctorCard extends StatelessWidget {
  final String nama, kontak, alamat, linkImage;
  final VoidCallback? onPressed;
  const DoctorCard({
    super.key,
    required this.nama,
    required this.kontak,
    required this.alamat,
    required this.linkImage,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(2, 4), // arah bayangan (x, y)
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Image.asset(
                      linkImage,
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          nama,
                          style: TextStyle(color: MyColors.gold, fontWeight: FontWeight.bold, fontSize: MySizes.fontSizeMd),
                        ).marginOnly(bottom: 4),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Kontak',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                kontak,
                                style: TextStyle(color: MyColors.gold, fontSize: 12),
                              ),
                            ),
                          ],
                        ).marginOnly(bottom: 4),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 16,
                            ),
                            Expanded(
                              child: Text(
                                alamat,
                                softWrap: true,
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ).marginOnly(bottom: 6),
            ],
          ),
        ),
      ),
    );
  }
}
