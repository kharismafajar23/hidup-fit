import 'dart:convert';

import 'package:dart_openai/dart_openai.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/data/services/db_helper.dart';
import 'package:hidup_fit/utils/local_storage/storage_utility.dart';

class StatistikController extends GetxController {
  final Map<String, dynamic> arguments = Get.arguments ?? {};

  final isLoading = false.obs;
  final dataKesehatan = <String, dynamic>{}.obs;
  final analysisResult = ''.obs;

  String promptText() {
    final beratBadan = arguments['beratBadan'] ?? 'tidak diberikan';
    final tekananDarah = arguments['tekananDarah'] ?? 'tidak diberikan';
    final detakJantung = arguments['detakJantung'] ?? 'tidak diberikan';
    final tinggiBadan = arguments['tinggiBadan'] ?? 'tidak diberikan';
    final suhuTubuh = arguments['suhuTubuh'] ?? 'tidak diberikan';
    final jumlahLangkah = arguments['jumlahLangkah'] ?? 'tidak diberikan';
    final catatan = arguments['catatan'] ?? '-';

    return '''
Anda adalah asisten kesehatan yang sangat membantu, tetapi bukan dokter. 
Analisa data kesehatan berikut:

- Berat badan: $beratBadan kg
- Tekanan darah: $tekananDarah mmHg
- Detak jantung: $detakJantung bpm
- Tinggi badan: $tinggiBadan cm
- Suhu tubuh: $suhuTubuh °C
- Langkah hari ini: $jumlahLangkah langkah
- Catatan: $catatan

Berikan ringkasan singkat dalam bahasa Indonesia, sebutkan kemungkinan masalah, 
dan berikan saran sederhana (hindari diagnosis medis). Berikan dalam bentuk paragraf.
    ''';
  }

  @override
  void onInit() {
    super.onInit();
    if (arguments['type'] == 'baru') {
      analyze();
    } else if (arguments['type'] == 'detail') {
      loadDetailKesehatan();
    } else {
      loadDataAnalisa();
    }
  }

  Future<void> analyze() async {
    analysisResult.value = '';
    isLoading.value = true;

    try {
      final response = await OpenAI.instance.chat.create(
        model: "gpt-4o-mini",
        messages: [
          OpenAIChatCompletionChoiceMessageModel(
            role: OpenAIChatMessageRole.system,
            content: [
              OpenAIChatCompletionChoiceMessageContentItemModel.text(
                "Anda adalah asisten medis Indonesia yang ringkas dan ramah.",
              ),
            ],
          ),
          OpenAIChatCompletionChoiceMessageModel(
            role: OpenAIChatMessageRole.user,
            content: [
              OpenAIChatCompletionChoiceMessageContentItemModel.text(
                promptText(),
              ),
            ],
          ),
        ],
        maxTokens: 500,
        temperature: 0.2,
      );

      final aiText = response.choices.first.message.content?.map((e) => e.text).join(" ").trim() ?? 'Tidak ada jawaban dari AI.';

      analysisResult.value = aiText;
    } catch (e) {
      analysisResult.value = 'Terjadi kesalahan: $e';
    } finally {
      isLoading.value = false;

      // simpan data
      dataKesehatan.assignAll({
        'tanggal': arguments['tanggal'] ?? '',
        'beratBadan': arguments['beratBadan'] ?? '',
        'tekananDarah': arguments['tekananDarah'] ?? '',
        'detakJantung': arguments['detakJantung'] ?? '',
        'tinggiBadan': arguments['tinggiBadan'] ?? '',
        'suhuTubuh': arguments['suhuTubuh'] ?? '',
        'jumlahLangkah': arguments['jumlahLangkah'] ?? '',
        'catatan': analysisResult.value,
      });

      final localStorage = UseLocalStorage();
      localStorage.saveData('dataKesehatan', dataKesehatan);
      localStorage.saveData('catatanKesehatan', analysisResult.value);

      final userData = localStorage.readData('username');
      final user = jsonDecode(userData);

      await DBHelper.instance.insertDataKesehatan(
        idUser: user['id'],
        tanggal: arguments['tanggal'] ?? '',
        beratBadan: arguments['beratBadan'] ?? '',
        tekananDarah: arguments['tekananDarah'] ?? '',
        detakJantung: arguments['detakJantung'] ?? '',
        tinggiBadan: arguments['tinggiBadan'] ?? '',
        suhuTubuh: arguments['suhuTubuh'] ?? '',
        jumlahLangkah: arguments['jumlahLangkah'] ?? '',
        catatan: analysisResult.value,
      );
    }
  }

  Future<void> loadDetailKesehatan() async {
    final result = await DBHelper.instance.getDataKesehatanDetail(arguments['id_riwayat'] ?? '');
    if (result != null) {
      dataKesehatan.assignAll({
        'tanggal': result['tanggal'] ?? '',
        'beratBadan': result['berat_badan'] ?? '',
        'tekananDarah': result['tekanan_darah'] ?? '',
        'detakJantung': result['detak_jantung'] ?? '',
        'tinggiBadan': result['tinggi_badan'] ?? '',
        'suhuTubuh': result['suhu_tubuh'] ?? '',
        'jumlahLangkah': result['jumlah_langkah'] ?? '',
        'catatan': result['catatan'] ?? '',
      });

      analysisResult.value = result['catatan'] ?? '';
    }
  }

  void loadDataAnalisa() {
    final localStorage = UseLocalStorage();
    final savedData = localStorage.readData('dataKesehatan') ?? {};
    dataKesehatan.assignAll(savedData);
    analysisResult.value = localStorage.readData('catatanKesehatan') ?? 'kosong';
  }
}
