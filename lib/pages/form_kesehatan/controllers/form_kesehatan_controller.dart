import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/routes/app_routes.dart';
import 'package:hidup_fit/utils/local_storage/storage_utility.dart';
import 'package:intl/intl.dart';

class FormKesehatanController extends GetxController {

  RxBool isValidateFirst = false.obs;
  RxBool isValidAll = false.obs;

  TextEditingController tanggalController = TextEditingController();
  RxBool validateTanggal = true.obs;
  RxString msgTanggal = "".obs;

  TextEditingController beratBadanController = TextEditingController();
  RxBool validateBeratBadan = true.obs;
  RxString msgBeratBadan = "".obs;

  TextEditingController tekananDarahController = TextEditingController();
  RxBool validateTekananDarah = true.obs;
  RxString msgTekananDarah = "".obs;

  TextEditingController detakJantungController = TextEditingController();
  RxBool validateDetakJantung = true.obs;
  RxString msgDetakJantung = "".obs;

  TextEditingController tinggiBadanController = TextEditingController();
  RxBool validateTinggiBadan = true.obs;
  RxString msgTinggiBadan = "".obs;

  TextEditingController suhuTubuhController = TextEditingController();
  RxBool validateSuhuTubuh = true.obs;
  RxString msgSuhuTubuh = "".obs;

  TextEditingController jumlahLangkahController = TextEditingController();
  RxBool validateJumlahLangkah = true.obs;
  RxString msgJumlahLangkah = "".obs;

  TextEditingController catatanController = TextEditingController();
  RxString msgCatatan = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      tanggalController.text = picked.toIso8601String();
    }
  }

  onValidationFormInput(String? val) {
    if (isValidateFirst.value) {
      String valueTanggal = tanggalController.text.toString().trim();
      String valueBeratBadan = beratBadanController.text.toString().trim();
      String valueTekananDarah = tekananDarahController.text.toString().trim();
      String valueDetakJantung = detakJantungController.text.toString().trim();
      String valueTinggiBadan = tinggiBadanController.text.toString().trim();
      String valueSuhuTubuh = suhuTubuhController.text.toString().trim();
      String valueJumlahLangkah = jumlahLangkahController.text.toString().trim();
      String catatan = catatanController.text.toString().trim();

      if (valueBeratBadan.isEmpty) {
        validateBeratBadan.value = false;
        msgBeratBadan.value = "Berat Badan harus di isi";
      } else {
        validateBeratBadan.value = true;
        msgBeratBadan.value = "";
      }

      if (valueTekananDarah.isEmpty) {
        validateTekananDarah.value = false;
        msgTekananDarah.value = "Tekanan darah harus di isi";
      } else {
        validateTekananDarah.value = true;
        msgTekananDarah.value = "";
      }

      if (valueDetakJantung.isEmpty) {
        validateDetakJantung.value = false;
        msgDetakJantung.value = "Detak jantung harus di isi";
      } else {
        validateDetakJantung.value = true;
        msgDetakJantung.value = "";
      }

      if (valueTinggiBadan.isEmpty) {
        validateTinggiBadan.value = false;
        msgTinggiBadan.value = "Tinggi badan harus di isi";
      } else {
        validateTinggiBadan.value = true;
        msgTinggiBadan.value = "";
      }

      if (valueSuhuTubuh.isEmpty) {
        validateSuhuTubuh.value = false;
        msgSuhuTubuh.value = "Suhu tubuh harus di isi";
      } else {
        validateSuhuTubuh.value = true;
        msgSuhuTubuh.value = "";
      }

      if (valueJumlahLangkah.isEmpty) {
        validateJumlahLangkah.value = false;
        msgJumlahLangkah.value = "Suhu tubuh harus di isi";
      } else {
        validateJumlahLangkah.value = true;
        msgJumlahLangkah.value = "";
      }
    }

    return validateTanggal.value && validateBeratBadan.value && validateTekananDarah.value && validateDetakJantung.value && validateTinggiBadan.value && validateSuhuTubuh.value && validateJumlahLangkah.value;
  }

  Future analisaKesehatan() async {
    print('######################');
    print(tanggalController.text.toString().trim());
    isValidateFirst.value = true;
    bool validation = await onValidationFormInput(null);

    if (validation) {
      var dataKesehatan = {
        'type': 'baru',
        'tanggal': tanggalController.text.toString().trim(),
        'beratBadan': beratBadanController.text.toString().trim(),
        'tekananDarah': tekananDarahController.text.toString().trim(),
        'detakJantung': detakJantungController.text.toString().trim(),
        'tinggiBadan': tinggiBadanController.text.toString().trim(),
        'suhuTubuh': suhuTubuhController.text.toString().trim(),
        'jumlahLangkah': jumlahLangkahController.text.toString().trim(),
        'catatan': catatanController.text.toString().trim()
      };

      final localStorage = UseLocalStorage();
      localStorage.saveData('dataKesehatan', dataKesehatan);

      Get.toNamed(AppRoutes.statistikKesehatan, arguments: dataKesehatan);

    } else {
      Get.snackbar('Gagal', 'Silahkan isi semua bagian terlebih dahulu', backgroundColor: Colors.red, icon: Icon(Icons.error_outlined));
    }
  }
}
