import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/common/widgets/back_button.dart';
import 'package:hidup_fit/utils/constant/colors.dart';
import 'package:hidup_fit/utils/device/device_utility.dart';
import 'package:hidup_fit/utils/theme/custom_themes/text_styles.dart';

class DetailNewsScreen extends StatelessWidget {
  const DetailNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: CustomDeviceUtils.getScreenHeight() - MediaQuery.of(context).padding.top,
              ),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/news/news1.jpg',
                        height: 270,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        child: Column(
                          children: [
                            Text(
                              '7 Kebiasaan Pagi yang Bikin Tubuh Lebih Sehat dan Produktif',
                              style: TextStyle(
                                color: CustomColors.textPrimary,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ).marginOnly(bottom: 20),
                            Text(
                              'Memulai hari dengan kebiasaan yang tepat dapat meningkatkan kesehatan dan produktivitas secara signifikan. Bangun lebih awal memberi waktu untuk menyiapkan diri tanpa tergesa-gesa, sementara minum air putih setelah bangun membantu tubuh rehidrasi. Olahraga ringan seperti stretching atau jalan pagi mampu meningkatkan energi dan mood. Sarapan bergizi memberi asupan yang dibutuhkan tubuh untuk beraktivitas, dan berjemur di bawah sinar matahari pagi membantu pembentukan vitamin D. Hindari langsung menatap layar ponsel agar otak tidak stres sejak pagi, dan menulis daftar rencana harian dapat membuat hari lebih terarah dan produktif.',
                              style: TextStyle(color: CustomColors.textPrimary, fontWeight: FontWeight.w300),
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
              )),
        ),
      ),
    );
  }
}
