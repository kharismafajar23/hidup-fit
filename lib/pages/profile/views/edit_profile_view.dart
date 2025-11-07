import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/common/widgets/scrollable_widget.dart';
import 'package:hidup_fit/common/widgets/title_app.dart';
import 'package:hidup_fit/pages/profile/controllers/edit_profile_controller.dart';
import 'package:hidup_fit/utils/constant/colors.dart';
import 'package:hidup_fit/utils/device/device_utility.dart';
import 'package:hidup_fit/utils/theme/widget_themes/text_styles.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    print('Controller hash: ${controller.hashCode}');

    return ScrollableScreen(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleApp(),
          Center(
            child: Text(
              'Edit Profil',
              textAlign: TextAlign.center,
              style: MyTextStyles.headingText.copyWith(color: MyColors.primary),
            ).marginOnly(bottom: 16),
          ),
          SizedBox(
            width: MyDeviceUtils.getScreenWidth(context),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  TextField(
                    controller: controller.nameController,
                    decoration: const InputDecoration(labelText: 'Nama Lengkap'),
                  ).marginOnly(bottom: 12),
                  TextField(
                    controller: controller.usernameController,
                    decoration: const InputDecoration(labelText: 'Username'),
                  ).marginOnly(bottom: 12),
                  TextField(
                    controller: controller.tanggalLahirController,
                    decoration: const InputDecoration(labelText: 'Tanggal Lahir'),
                    readOnly: true,
                    onTap: () async {
                      DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.tryParse(controller.tanggalLahirController.text) ?? DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (picked != null) {
                        controller.tanggalLahirController.text = picked.toIso8601String().split('T').first;
                      }
                    },
                  ).marginOnly(bottom: 12),
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
                      decoration: const InputDecoration(labelText: 'Jenis Kelamin'),
                    );
                  }).marginOnly(bottom: 12),
                  TextField(
                    controller: controller.passwordController,
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ).marginOnly(bottom: 30),
                  ElevatedButton(
                    onPressed: () {
                      controller.saveProfile();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MyColors.gold,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text('Simpan Perubahan'),
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
