import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/common/widgets/form_input.dart';
import 'package:hidup_fit/common/widgets/form_input_date.dart';
import 'package:hidup_fit/features/authentication/controllers/signup_controller.dart';
import 'package:hidup_fit/features/authentication/screens/otp.dart';
import 'package:hidup_fit/utils/constant/image_strings.dart';
import 'package:hidup_fit/utils/constant/text_strings.dart';
import 'package:hidup_fit/utils/device/device_utility.dart';
import 'package:hidup_fit/utils/theme/custom_themes/text_styles.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(SignupController());

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
                      height: 120,
                      width: 120,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      CustomTexts.appName,
                      style: CustomTextStyles.headingText,
                    ).marginOnly(bottom: 38),
                    Text(
                      CustomTexts.signUp,
                      style: CustomTextStyles.paragraphText,
                    ).marginOnly(bottom: 20),
                    FormInput(label: CustomTexts.masukkanNama),
                    InkWell(
                        onTap: () async {
                          FocusScope.of(context).requestFocus(FocusNode());
                          showDatePicker(
                            context: context,
                            // initialDate: controller.selectedDate.value,
                            firstDate: DateTime(1950, 1, 1),
                            lastDate: DateTime.now().add(const Duration(days: 365)),
                            initialEntryMode: DatePickerEntryMode.calendarOnly,
                          );
                        },
                        child: FormInputDate(
                          label: CustomTexts.masukkanTanggalLahir,
                          enabled: false,
                        )),
                    FormInput(label: CustomTexts.masukkanEmail),
                    FormInput(
                      label: CustomTexts.masukkanKataSandi,
                      isPassword: true,
                    ),
                    SizedBox(
                      width: CustomDeviceUtils.getScreenWidth(context) * 3 / 5,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(OtpScreen());
                        },
                        child: Text('DAFTAR'),
                      ),
                    ).marginOnly(bottom: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(CustomTexts.belumPunyaAkun).marginOnly(right: 8),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Text(CustomTexts.masukSekarang),
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
