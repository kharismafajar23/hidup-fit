import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/utils/constant/colors.dart';
import 'package:hidup_fit/utils/constant/sizes.dart';

class DoctorCard extends StatelessWidget {
  final String nama, spealisasi, pengalaman, rating, status, linkImage;
  const DoctorCard({
    super.key,
    required this.nama,
    required this.spealisasi,
    required this.pengalaman,
    required this.rating,
    required this.status,
    required this.linkImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                              'Spesialisasi',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              spealisasi,
                              style: TextStyle(color: MyColors.gold, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            'Pengalaman',
                            style: TextStyle(fontSize: 12),
                          )),
                          Expanded(
                            child: Text(
                              pengalaman,
                              style: TextStyle(color: MyColors.gold, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            'Rating',
                            style: TextStyle(fontSize: 12),
                          )),
                          Expanded(
                            child: Text(
                              rating,
                              style: TextStyle(color: MyColors.gold, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            'Status',
                            style: TextStyle(fontSize: 12),
                          )),
                          Expanded(
                            child: Text(
                              status,
                              style: TextStyle(color: MyColors.gold, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ).marginOnly(bottom: 6),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                side: BorderSide(color: MyColors.gold),
                backgroundColor: MyColors.gold,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              child: Text('Konsultasi Sekarang'),
            )
          ],
        ),
      ),
    );
  }
}
