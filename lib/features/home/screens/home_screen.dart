import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/utils/constant/colors.dart';
import 'package:hidup_fit/utils/constant/image_strings.dart';
import 'package:hidup_fit/utils/constant/text_strings.dart';
import 'package:hidup_fit/utils/device/device_utility.dart';
import 'package:hidup_fit/utils/theme/custom_themes/text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                      Expanded(
                          child: Row(
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
                      )),
                      Icon(
                        Icons.notifications_none_rounded,
                        color: CustomColors.primary,
                        size: 36,
                      )
                    ],
                  ).marginOnly(bottom: 24),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/images/home.jpg',
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            left: 0,
                            bottom: 0,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(24),
                              ),
                              child: Container(
                                color: CustomColors.white,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Selamat Datang, ',
                                        style: TextStyle(color: CustomColors.primary, fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        'Alfian !',
                                        style: TextStyle(color: CustomColors.primary, fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ).marginOnly(bottom: 12),
                  Text(
                    'Yuk pantau kesehatanmu hari ini!',
                    style: CustomTextStyles.paragraphText.copyWith(fontStyle: FontStyle.italic),
                  ).marginOnly(bottom: 6),
                  Row(
                    spacing: 8,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                          child: Container(
                            width: double.infinity,
                            height: 80,
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/icons/heart.png'),
                                Text(
                                  '78 bpm',
                                  style: TextStyle(color: Color.fromRGBO(236, 122, 122, 1), fontSize: 12),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                          child: Container(
                            width: double.infinity,
                            height: 80,
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/icons/kalori.png').marginOnly(bottom: 4),
                                Text(
                                  '350 kcal',
                                  style: TextStyle(color: Color.fromRGBO(92, 140, 182, 1), fontSize: 12),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                          child: Container(
                            width: double.infinity,
                            height: 80,
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/icons/langkah.png').marginOnly(bottom: 4),
                                Text(
                                  '5200 langkah',
                                  style: TextStyle(color: Color.fromRGBO(166, 222, 171, 1), fontSize: 10),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                          child: Container(
                            width: double.infinity,
                            height: 80,
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/icons/tidur.png').marginOnly(bottom: 4),
                                Text(
                                  '7 jam 10 menit',
                                  style: TextStyle(color: Color.fromRGBO(196, 170, 110, 1), fontSize: 10),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
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
