import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/data/services/db_helper.dart';
import 'package:hidup_fit/routes/app_routes.dart';
import 'package:hidup_fit/utils/local_storage/storage_utility.dart';

class ScreeningEntryController extends GetxController {
  final isLoading = false.obs;

  final isChecking = true.obs;
  final lastResult = Rxn<Map<String, dynamic>>();

  late int userId;
  final localStorage = UseLocalStorage();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _init();
  }

  Future<void> _init() async {
    await _loadUser();
    await _checkPreviousScreening();
    isChecking.value = false;

    if (lastResult.value != null) {
      _showChoiceDialog();
    }
  }

  Future<void> _loadUser() async {
    final userData = localStorage.readData('username');
    if (userData != null) {
      final user = jsonDecode(userData);
      userId = user['id'];
    }
  }

  Future<void> _checkPreviousScreening() async {
    lastResult.value = await DBHelper.instance.getLastScreeningResult(userId);
    print(lastResult.value ?? 'Belum adaaaaaaaaaaaaaaaaaaa');
  }

  void startNewScreening() {
    Get.toNamed(AppRoutes.screening);
  }

  void viewLastResult() {
    Get.back();
    Get.toNamed(
      AppRoutes.screeningResult,
      arguments: {
        'fromHistory': true,
        'result': lastResult.value,
      },
    );
  }

  void _showChoiceDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text('Screening Sebelumnya Ditemukan'),
        content: Text(
          'Terakhir diperbarui pada:\n${lastResult.value!['tanggal']}',
        ),
        actions: [
          TextButton(
            onPressed: viewLastResult,
            child: const Text(
              'Lihat Hasil',
              style: TextStyle(color: Color.fromARGB(255, 43, 42, 42)),
            ),
          ),
          TextButton.icon(
            onPressed: () {
              Get.back();
              startNewScreening();
            },
            icon: Icon(Icons.repeat),
            label: const Text('Screening Ulang'),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }
}
