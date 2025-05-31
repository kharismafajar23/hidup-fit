import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/features/authentication/screens/login.dart';
import 'package:hidup_fit/utils/constant/sizes.dart';
import 'package:hidup_fit/utils/device/device_utility.dart';
import 'package:hidup_fit/utils/theme/custom_themes/text_styles.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SafeArea(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: CustomDeviceUtils.getScreenHeight() - MediaQuery.of(context).padding.top,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.arrow_back,
                    size: CustomSizes.iconLg,
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Masukkan Kode OTP',
                          style: CustomTextStyles.headingText,
                        ).marginOnly(bottom: 30),
                        Row(
                          spacing: CustomSizes.sm,
                          children: [
                            Expanded(
                              child: TextField(
                                maxLength: 1,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: CustomSizes.fontSizeMd,
                                ),
                                decoration: InputDecoration(
                                  counterText: '',
                                ),
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                maxLength: 1,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: CustomSizes.fontSizeMd,
                                ),
                                decoration: InputDecoration(
                                  counterText: '',
                                ),
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                maxLength: 1,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: CustomSizes.fontSizeMd,
                                ),
                                decoration: InputDecoration(
                                  counterText: '',
                                ),
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                maxLength: 1,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: CustomSizes.fontSizeMd,
                                ),
                                decoration: InputDecoration(
                                  counterText: '',
                                ),
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                maxLength: 1,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: CustomSizes.fontSizeMd,
                                ),
                                decoration: InputDecoration(
                                  counterText: '',
                                ),
                              ),
                            ),
                          ],
                        ).marginOnly(bottom: 30),
                        Text(
                          'Kami telah meningirimkan Kode Verifikasi ke Email Anda',
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.paragraphText,
                        ).marginOnly(bottom: 50),
                        SizedBox(
                          width: CustomDeviceUtils.getScreenWidth(context) * 3 / 5,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.to(Login());
                            },
                            child: Text(
                              'VERIFIKASI',
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                          ),
                        ).marginOnly(bottom: 30),
                        Text(
                          'Belum menerima kode? Kirim ulang dalam 00:30 detik',
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.paragraphText,
                        ).marginOnly(bottom: 50),
                        SizedBox(
                          width: CustomDeviceUtils.getScreenWidth(context) * 3 / 5,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'RESEND CODE',
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                      ],
                    ),
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
