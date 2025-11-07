import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/data/services/db_helper.dart';
import 'package:hidup_fit/routes/app_routes.dart';

class RegisterController extends GetxController {
  final user = {}.obs;

  RxBool isValidateFirst = false.obs;
  RxBool isValidAll = false.obs;

  TextEditingController nameController = TextEditingController();
  RxBool validateName = true.obs;
  RxString msgName = "".obs;

  TextEditingController tanggalLahirController = TextEditingController();
  RxBool validateTanggalLahir = true.obs;
  RxString msgTanggalLahir = "".obs;

  TextEditingController usernameController = TextEditingController();
  RxBool validateUsername = true.obs;
  RxString msgUsername = "".obs;

  TextEditingController passwordController = TextEditingController();
  RxBool validatePassword = true.obs;
  RxString msgPassword = ''.obs;

  RxString selectedGender = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<bool> register(String name, String tanggalLahir, String username, String password, String jenisKelamin) async {
    final existing = await DBHelper.instance.getUserByUsername(username);
    if (existing != null) return false;
    await DBHelper.instance.insertUser(name, tanggalLahir, username, password, jenisKelamin);
    return true;
  }

  Future<void> selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      tanggalLahirController.text = picked.toIso8601String().split('T')[0];
    }
  }

  onValidationFormInput(String? val) {
    if (isValidateFirst.value) {
      String valueName = nameController.text.toString().trim();
      String valueTanggalLahir = tanggalLahirController.text.toString().trim();
      String valueUsername = usernameController.text.toString().trim();
      String valuePassword = passwordController.text.toString().trim();

      if (valueName.isEmpty) {
        validateName.value = false;
        msgName.value = "Nama harus di isi";
      } else {
        validateName.value = true;
        msgName.value = "";
      }

      if (valueTanggalLahir.isEmpty) {
        validatePassword.value = false;
        msgPassword.value = "Password harus diisi";
      } else {
        validatePassword.value = true;
        msgPassword.value = "";
      }

      if (valueUsername.isEmpty) {
        validateUsername.value = false;
        msgUsername.value = "Username harus diisi";
      } else {
        validateUsername.value = true;
        msgUsername.value = "";
      }

      if (valuePassword.isEmpty) {
        validatePassword.value = false;
        msgPassword.value = "Password harus di isi";
      } else {
        validatePassword.value = true;
        msgPassword.value = "";
      }
    }

    return validateName.value && validateTanggalLahir.value && validateUsername.value && validatePassword.value;
  }

  Future registerClick() async {
    isValidateFirst.value = true;
    bool validation = await onValidationFormInput(null);
    if (validation) {
      bool registerUser = await register(nameController.text, tanggalLahirController.text, usernameController.text, passwordController.text, selectedGender.value);
      if (registerUser) {
        Get.offNamed(AppRoutes.verifikasiOTP);
      } else {
        Get.snackbar('Register Gagal', 'Username sudah digunakan', backgroundColor: Colors.red, icon: Icon(Icons.error_outlined));
      }
    } else {
      Get.snackbar('Gagal', 'Silahkan isi semua bagian terlebih dahulu', backgroundColor: Colors.red, icon: Icon(Icons.error_outlined));
    }
  }
}
