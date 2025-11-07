import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/common/widgets/scrollable_widget.dart';
import 'package:hidup_fit/utils/constant/colors.dart';
import 'package:hidup_fit/utils/constant/image_strings.dart';
import 'package:hidup_fit/utils/constant/text_strings.dart';
import 'package:hidup_fit/utils/device/device_utility.dart';
import 'package:hidup_fit/utils/theme/widget_themes/text_styles.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return ScrollableScreen(
      child: Column(
        children: [
          Image.asset(
            MyImages.appLogo,
            height: 150,
            width: 150,
            fit: BoxFit.contain,
          ),
          Text(
            MyTexts.appName,
            style: MyTextStyles.headingText,
          ).marginOnly(bottom: 38),
          Text(
            'Sign Up',
            style: MyTextStyles.paragraphText.copyWith(fontSize: 24, fontWeight: FontWeight.bold),
          ).marginOnly(bottom: 20),
          SizedBox(
            width: MyDeviceUtils.getScreenWidth(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Masukkan Nama', style: MyTextStyles.labelText).marginOnly(bottom: 4),
                TextField(
                  controller: controller.nameController,
                  onChanged: controller.onValidationFormInput,
                  decoration: InputDecoration(
                    hintText: 'Masukan nama di sini...',
                    hintStyle: TextStyle(fontWeight: FontWeight.normal),
                    errorText: !controller.validateName.value ? controller.msgName.value : null,
                  ),
                  // autofocus: true,
                ).marginOnly(bottom: 16),
                Text('Masukkan Tanggal Lahir', style: MyTextStyles.labelText).marginOnly(bottom: 4),
                TextField(
                  controller: controller.tanggalLahirController,
                  onChanged: controller.onValidationFormInput,
                  readOnly: true,
                  onTap: () => controller.selectDate(context),
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.calendar_month_rounded,
                      color: MyColors.primary,
                    ),
                    errorText: !controller.validateTanggalLahir.value ? controller.msgTanggalLahir.value : null,
                  ),
                ).marginOnly(bottom: 16),
                Text('Pilih Jenis Kelamin', style: MyTextStyles.labelText).marginOnly(bottom: 4),
                Obx(() {
                  return DropdownButtonFormField<String>(
                    value: controller.selectedGender.value.isEmpty ? null : controller.selectedGender.value,
                    items: const [
                      DropdownMenuItem(value: 'Laki-laki', child: Text('Laki-laki')),
                      DropdownMenuItem(value: 'Perempuan', child: Text('Perempuan')),
                    ],
                    onChanged: (value) {
                      controller.selectedGender.value = value ?? '';
                    },
                    decoration: const InputDecoration(hintText: 'Pilih jenis kelamin disini'),
                  );
                }).marginOnly(bottom: 12),
                Text('Masukkan Username', style: MyTextStyles.labelText).marginOnly(bottom: 4),
                TextField(
                  controller: controller.usernameController,
                  onChanged: controller.onValidationFormInput,
                  decoration: InputDecoration(
                    hintText: 'Masukan username di sini...',
                    hintStyle: TextStyle(fontWeight: FontWeight.normal),
                    errorText: !controller.validateUsername.value ? controller.msgUsername.value : null,
                  ),
                ).marginOnly(bottom: 16),
                Text('Masukkan Kata Sandi', style: MyTextStyles.labelText).marginOnly(bottom: 4),
                TextField(
                  controller: controller.passwordController,
                  onChanged: controller.onValidationFormInput,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Masukan kata sandi di sini...',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.normal,
                    ),
                    errorText: !controller.validatePassword.value ? controller.msgPassword.value : null,
                  ),
                ).marginOnly(bottom: 16),
                SizedBox(
                  width: MyDeviceUtils.getScreenWidth(context),
                  child: ElevatedButton(
                    onPressed: () {
                      controller.registerClick();
                    },
                    child: Text('DAFTAR'),
                  ),
                ).marginOnly(bottom: 20),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Sudah Punya Akun?', style: TextStyle(color: MyColors.primary)).marginOnly(right: 8),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Text('Masuk Sekarang', style: TextStyle(color: MyColors.primary, fontWeight: FontWeight.bold)),
              )
            ],
          )
        ],
      ),
    );
  }
}
