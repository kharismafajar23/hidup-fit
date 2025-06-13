import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:hidup_fit/routes/app_routes.dart';
import 'package:hidup_fit/utils/local_storage/storage_utility.dart';

import '../../../data/services/db_helper.dart';

class LoginController extends GetxController {
  final user = {}.obs;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<bool> login(String username, String password) async {
    final result = await DBHelper.instance.getUser(username, password);
    if (result != null) {
      user.value = result;

      final localStorage = UseLocalStorage();
      localStorage.saveData('username', jsonEncode(result));

      return true;
    }
    return false;
  }

  Future loginClick() async {
    bool success = await login(usernameController.text, passwordController.text);
    if (success) {
      Get.offNamed(AppRoutes.bottomNavigationMenu);
    } else {
      Get.snackbar('Gagal', 'Login gagal, silahkan cek username dan password Anda', backgroundColor: Colors.red, icon: Icon(Icons.error_outlined));
    }
  }
}
