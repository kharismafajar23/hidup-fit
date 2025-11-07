import 'dart:convert';

import 'package:get/get.dart';
import 'package:hidup_fit/data/services/db_helper.dart';
import 'package:hidup_fit/utils/local_storage/storage_utility.dart';

class RiwayatKesehatanController extends GetxController {
  final daftarRiwayatKesehatan = [].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadRiwayatKesehatan();
  }

  Future<void> loadRiwayatKesehatan() async {
    final localStorage = UseLocalStorage();
    final userData = localStorage.readData('username');
    final user = jsonDecode(userData);
    var result = await DBHelper.instance.getHistoryKesehatan(user['id'], 5);
    if (result.isNotEmpty) {
      daftarRiwayatKesehatan.value = result;
    }
  }
}
