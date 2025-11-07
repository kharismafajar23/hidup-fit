import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/data/services/db_helper.dart';
import 'package:hidup_fit/utils/local_storage/storage_utility.dart';

class EditProfileController extends GetxController {
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final tanggalLahirController = TextEditingController();
  final passwordController = TextEditingController();

  final localStorage = UseLocalStorage();
  RxInt userId = 0.obs;
  RxString selectedGender = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserData();
    update();
  }

  void loadUserData() {
    final userDataString = localStorage.readData('username');
    if (userDataString != null) {
      final userData = jsonDecode(userDataString);
      userId.value = userData['id'];
      nameController.text = userData['name'] ?? '';
      usernameController.text = userData['username'] ?? '';
      tanggalLahirController.text = userData['tanggal_lahir'] ?? '';
      passwordController.text = userData['password'] ?? '';
      selectedGender.value = userData['jenis_kelamin'] ?? '';
    }
  }

  Future<void> saveProfile() async {
    if (userId.value == 0) return;

    await DBHelper.instance.updateUser(
      userId.value,
      nameController.text,
      usernameController.text,
      tanggalLahirController.text,
      passwordController.text,
      selectedGender.value,
    );

    // update local storage juga
    final updatedUser = {
      'id': userId.value,
      'name': nameController.text,
      'username': usernameController.text,
      'tanggal_lahir': tanggalLahirController.text,
      'password': passwordController.text,
      'jenis_kelamin': selectedGender.value,
    };
    localStorage.saveData('username', jsonEncode(updatedUser));

    Get.snackbar('Berhasil', 'Profil berhasil diperbarui', snackPosition: SnackPosition.TOP);
  }
}
