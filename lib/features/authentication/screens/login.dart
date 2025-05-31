import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/common/widgets/form_input.dart';
import 'package:hidup_fit/features/authentication/screens/signup.dart';
import 'package:hidup_fit/navigation_menu.dart';
import 'package:hidup_fit/utils/constant/image_strings.dart';
import 'package:hidup_fit/utils/constant/text_strings.dart';
import 'package:hidup_fit/utils/device/device_utility.dart';
import 'package:hidup_fit/utils/theme/custom_themes/text_styles.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: CustomDeviceUtils.getScreenHeight() - MediaQuery.of(context).padding.top,
              ),
              child: Center(
                child: Column(
                  children: [
                    Image.asset(
                      CustomImages.appLogo,
                      height: 150,
                      width: 150,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      CustomTexts.appName,
                      style: CustomTextStyles.headingText,
                    ).marginOnly(bottom: 38),
                    Text(
                      CustomTexts.login,
                      style: CustomTextStyles.paragraphText,
                    ).marginOnly(bottom: 20),
                    FormInput(label: CustomTexts.masukkanEmail),
                    FormInput(
                      label: CustomTexts.masukkanKataSandi,
                      isPassword: true,
                    ),
                    SizedBox(
                      width: CustomDeviceUtils.getScreenWidth(context),
                      child: Text(
                        CustomTexts.lupaKataSandi,
                        style: TextStyle(),
                        textAlign: TextAlign.right,
                      ).marginOnly(bottom: 26),
                    ),
                    SizedBox(
                      width: CustomDeviceUtils.getScreenWidth(context) * 3 / 5,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(NavigationMenu());
                        },
                        child: Text(CustomTexts.masuk),
                      ),
                    ).marginOnly(bottom: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(CustomTexts.belumPunyaAkun).marginOnly(right: 8),
                        GestureDetector(
                          onTap: () {
                            Get.to(Signup());
                          },
                          child: Text(CustomTexts.daftarSekarang),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
