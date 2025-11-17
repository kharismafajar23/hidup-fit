import 'dart:convert';
import 'package:dart_openai/dart_openai.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/data/services/db_helper.dart';
import 'package:hidup_fit/data/services/hitung_usia.dart';
import 'package:hidup_fit/utils/local_storage/storage_utility.dart';

class StatistikController extends GetxController {
  final Map<String, dynamic> arguments = Get.arguments ?? {};

  final isLoading = false.obs;
  var user = {}.obs;
  final dataKesehatan = <String, dynamic>{}.obs;
  final analysisResult = ''.obs;
  final analysisResultFormatted = Rxn<Map<String, dynamic>>();

  String promptText() {
    final beratBadan = arguments['beratBadan'] ?? 'tidak diberikan';
    final tekananDarah = arguments['tekananDarah'] ?? 'tidak diberikan';
    final detakJantung = arguments['detakJantung'] ?? 'tidak diberikan';
    final tinggiBadan = arguments['tinggiBadan'] ?? 'tidak diberikan';
    final suhuTubuh = arguments['suhuTubuh'] ?? 'tidak diberikan';
    final jumlahLangkah = arguments['jumlahLangkah'] ?? 'tidak diberikan';
    final lajuPernafasan = arguments['lajuPernafasan'] ?? 'tidak diberikan';
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
- Laju pernafasan: $lajuPernafasan napas/menit
- Usia: ${user['usia']}
- Catatan: $catatan

Berikan ringkasan singkat dalam bahasa Indonesia, apakah berat badan dalam kategori kurus, ideal, gemuk atau obesitas. 
Lalu apakah tekanan darah normal, tinggi atau rendah. 
Detak jantung apakah lambat, sedang atau cepat. 
Tinggi badan masuk kategori tinggi atau pendek.
Langkah termasuk kurang, cukup atau lebih.
Suhu tubuh termasuk rendah, tinggi atau normal.
Laju pernafasan termasuk lambat, normal atau cepat. 
Dari semua data kesehatan yang diberikan, apakah saya dalam kondisi sehat atau tidak sehat. 
Sebutkan kemungkinan masalah, kondisi kesehatan dengan jawaban sehat atau tidak sehat, dan berikan saran sederhana (hindari diagnosis medis). 
Berikan dalam bentuk JSON valid (bisa di-decode langsung) dengan struktur berikut:

{
  "ringkasan": {
    "berat_badan": "",
    "tekanan_darah": "",
    "detak_jantung": "",
    "tinggi_badan": "",
    "suhu_tubuh": "",
    "aktivitas_harian": "",
    "langkah": "",
    "laju_pernafasan": ""
  },
  "kondisi_kesehatan": "",
  "kemungkinan_masalah": "",
  "saran": ""
}
''';
  }

  @override
  void onInit() {
    super.onInit();
    loadUser();
    final type = arguments['type'];
    if (type == 'baru') {
      analyze();
    } else if (type == 'detail') {
      loadDetailKesehatan();
    } else {
      loadDataAnalisa();
    }
  }

  loadUser() {
    final localStorage = UseLocalStorage();
    final userData = localStorage.readData('username');

    if (userData != null) {
      final decoded = jsonDecode(userData);
      final umur = hitungUsia(decoded['tanggal_lahir'] ?? '');
      decoded['usia'] = umur.toString();

      user.value = decoded;
    } else {
      user.value = {};
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
              OpenAIChatCompletionChoiceMessageContentItemModel.text(promptText()),
            ],
          ),
        ],
        maxTokens: 900,
        temperature: 0.2,
      );

      // Gabungkan seluruh konten teks yang dikembalikan AI
      final aiText = response.choices.first.message.content?.map((e) => e.text).join(" ").trim() ?? 'Tidak ada jawaban dari AI.';

      // Bersihkan karakter ``` dan json agar bisa di-decode
      final cleaned = aiText.replaceAll('```', '').replaceAll('json', '').trim();

      // Coba parse JSON hasil analisa AI
      Map<String, dynamic>? parsed;
      try {
        parsed = jsonDecode(cleaned);
      } catch (e) {
        print("Gagal decode JSON: $e");
      }

      // Simpan hasil
      analysisResult.value = jsonEncode(parsed ??
          {
            "text": cleaned
          });

      // Simpan ke lokal & DB
      await saveData(parsed ??
          {
            "text": cleaned
          });
    } catch (e) {
      analysisResult.value = 'Terjadi kesalahan: $e';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> saveData(Map<String, dynamic> result) async {
    final localStorage = UseLocalStorage();

    final data = {
      'tanggal': arguments['tanggal'] ?? '',
      'beratBadan': arguments['beratBadan'] ?? '',
      'tekananDarah': arguments['tekananDarah'] ?? '',
      'detakJantung': arguments['detakJantung'] ?? '',
      'tinggiBadan': arguments['tinggiBadan'] ?? '',
      'suhuTubuh': arguments['suhuTubuh'] ?? '',
      'jumlahLangkah': arguments['jumlahLangkah'] ?? '',
      'lajuPernafasan': arguments['lajuPernafasan'] ?? '',
      'catatan': result,
    };

    dataKesehatan.assignAll(data);

    localStorage.saveData('dataKesehatan', data);
    localStorage.saveData('catatanKesehatan', result);

    analysisResultFormatted.value = jsonDecode(analysisResult.value);

    final userData = localStorage.readData('username');
    if (userData != null) {
      final user = jsonDecode(userData);

      await DBHelper.instance.insertDataKesehatan(
        idUser: user['id'],
        tanggal: data['tanggal'] ?? '',
        beratBadan: data['beratBadan'] ?? '',
        tekananDarah: data['tekananDarah'] ?? '',
        detakJantung: data['detakJantung'] ?? '',
        tinggiBadan: data['tinggiBadan'] ?? '',
        suhuTubuh: data['suhuTubuh'] ?? '',
        jumlahLangkah: data['jumlahLangkah'] ?? '',
        lajuPernafasan: data['lajuPernafasan'] ?? '',
        catatan: jsonEncode(result),
      );
    }
  }

  Future<void> loadDetailKesehatan() async {
    final id = arguments['id_riwayat'];
    if (id == null) return;

    final result = await DBHelper.instance.getDataKesehatanDetail(id);
    if (result != null) {
      dataKesehatan.assignAll({
        'tanggal': result['tanggal'] ?? '',
        'beratBadan': result['berat_badan'] ?? '',
        'tekananDarah': result['tekanan_darah'] ?? '',
        'detakJantung': result['detak_jantung'] ?? '',
        'tinggiBadan': result['tinggi_badan'] ?? '',
        'suhuTubuh': result['suhu_tubuh'] ?? '',
        'jumlahLangkah': result['jumlah_langkah'] ?? '',
        'lajuPernafasan': result['laju_pernafasan'] ?? '',
        'catatan': result['catatan'] ?? '',
      });

      analysisResult.value = result['catatan'] ?? '';

      analysisResultFormatted.value = jsonDecode(analysisResult.value);
    }
  }

  void loadDataAnalisa() {
    final localStorage = UseLocalStorage();
    final savedData = localStorage.readData('dataKesehatan') ?? {};
    dataKesehatan.assignAll(savedData);

    final savedNote = localStorage.readData('catatanKesehatan');
    analysisResult.value = savedNote != null ? jsonEncode(savedNote) : 'kosong';
    analysisResultFormatted.value = jsonDecode(analysisResult.value);
  }
}
