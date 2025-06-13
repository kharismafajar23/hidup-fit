import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/common/widgets/scrollable_widget.dart';
import 'package:hidup_fit/routes/app_routes.dart';
import 'package:hidup_fit/utils/constant/colors.dart';
import 'package:hidup_fit/utils/constant/sizes.dart';
import 'package:hidup_fit/utils/device/device_utility.dart';
import 'package:hidup_fit/utils/theme/widget_themes/text_styles.dart';

import '../controllers/verifikasi_otp_controller.dart';

class VerifikasiOtpView extends GetView<VerifikasiOtpController> {
  const VerifikasiOtpView({super.key});
  @override
  Widget build(BuildContext context) {
    return ScrollableScreen(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BackButton(
            color: MyColors.primary,
            style: ButtonStyle(
              iconSize: WidgetStatePropertyAll(32),
              backgroundColor: WidgetStatePropertyAll(Colors.white),
            ),
          ).marginOnly(bottom: 28),
          Center(
            child: Text(
              'MASUKKAN KODE OTP',
              style: MyTextStyles.headingText,
            ).marginOnly(bottom: 30),
          ),
          Row(
            spacing: MySizes.sm,
            children: [
              Expanded(
                child: TextField(
                  maxLength: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: MySizes.fontSizeMd,
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
                    fontSize: MySizes.fontSizeMd,
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
                    fontSize: MySizes.fontSizeMd,
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
                    fontSize: MySizes.fontSizeMd,
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
                    fontSize: MySizes.fontSizeMd,
                  ),
                  decoration: InputDecoration(
                    counterText: '',
                  ),
                ),
              ),
            ],
          ).marginOnly(bottom: 28),
          Center(
            child: SizedBox(
              width: MyDeviceUtils.getScreenWidth(context) * 4 / 5,
              child: Column(
                children: [
                  Text(
                    'Kami telah meningirimkan Kode Verifikasi ke Email Anda',
                    textAlign: TextAlign.center,
                    style: MyTextStyles.paragraphText,
                  ).marginOnly(bottom: 58),
                  SizedBox(
                    width: MyDeviceUtils.getScreenWidth(context),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.login);
                      },
                      child: Text('VERIFIKASI'),
                    ),
                  ).marginOnly(bottom: 28),
                  Text(
                    'Belum menerima kode? Kirim ulang dalam 00:30 detik',
                    textAlign: TextAlign.center,
                    style: MyTextStyles.paragraphText,
                  ).marginOnly(bottom: 58),
                  SizedBox(
                    width: MyDeviceUtils.getScreenWidth(context),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('RESEND CODE'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
