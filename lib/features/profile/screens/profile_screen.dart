import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/utils/constant/colors.dart';
import 'package:hidup_fit/utils/constant/image_strings.dart';
import 'package:hidup_fit/utils/constant/text_strings.dart';
import 'package:hidup_fit/utils/device/device_utility.dart';
import 'package:hidup_fit/utils/theme/custom_themes/text_styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Profil Saya',
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.headingText.copyWith(color: CustomColors.primary),
                    ).marginOnly(bottom: 16),
                  ),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        child: Image.asset(
                          'assets/images/profile.png',
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Nama Lengkap',
                                    style: TextStyle(color: CustomColors.primary, fontSize: 12, fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'Alfian',
                                    style: TextStyle(color: CustomColors.primary, fontSize: 12, fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Jenis Kelamin',
                                    style: TextStyle(color: CustomColors.primary, fontSize: 12, fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'Laki-laki',
                                    style: TextStyle(color: CustomColors.primary, fontSize: 12, fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Tanggal Lahir',
                                    style: TextStyle(color: CustomColors.primary, fontSize: 12, fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    '14 Mei 2001',
                                    style: TextStyle(color: CustomColors.primary, fontSize: 12, fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Usia',
                                    style: TextStyle(color: CustomColors.primary, fontSize: 12, fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    '24 Tahun',
                                    style: TextStyle(color: CustomColors.primary, fontSize: 12, fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ).marginOnly(bottom: 28),
                  Text(
                    'Akun & Keamanan',
                    style: CustomTextStyles.headingText.copyWith(color: CustomColors.primary, fontSize: 18),
                  ).marginOnly(bottom: 6),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Email',
                                    style: TextStyle(color: CustomColors.primary, fontSize: 12, fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'Alfian@gmail.com',
                                    style: TextStyle(color: CustomColors.primary, fontSize: 12, fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Nomor HP',
                                    style: TextStyle(color: CustomColors.primary, fontSize: 12, fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    '0812-3456-7890',
                                    style: TextStyle(color: CustomColors.primary, fontSize: 12, fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Ubah Kata Sandi',
                                    style: TextStyle(color: CustomColors.primary, fontSize: 12, fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ).marginOnly(bottom: 20),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Edit Profil',
                                    style: TextStyle(fontStyle: FontStyle.italic),
                                  )),
                            ).marginOnly(bottom: 8),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Bahasa Aplikasi',
                                    style: TextStyle(fontStyle: FontStyle.italic),
                                  )),
                            ).marginOnly(bottom: 8),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Keluar',
                                    style: TextStyle(fontStyle: FontStyle.italic),
                                  )),
                            ).marginOnly(bottom: 8),
                          ],
                        ),
                      )
                    ],
                  ).marginOnly(bottom: 28),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
