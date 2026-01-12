import 'dart:convert';

import 'package:get/get.dart';
import 'package:hidup_fit/data/models/section.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:hidup_fit/data/services/db_helper.dart';
import 'package:hidup_fit/utils/local_storage/storage_utility.dart';

class ScreeningResultController extends GetxController {
  final isLoading = false.obs;
  final analysisResult = ''.obs;
  final isFromHistory = false.obs;

  final localStorage = UseLocalStorage();
  late final int userId;

  late final List<Section> sections;

  String buildPrompt(List<Section> sections) {
    final buffer = StringBuffer();
    buffer.writeln("Anda adalah asisten medis skrining awal.");
    buffer.writeln("Berikut hasil kuesioner:");

    for (final s in sections) {
      buffer.writeln("\n${s.title}");
      for (final q in s.questions) {
        buffer.writeln("- ${q.text}: ${q.answer}");
      }
    }

    buffer.writeln("""
Buatkan:
Ringkasan kondisi kesehatan secara keseluruhan dengan singkat, dengan template sebagai berikut:
Menurut hasil screening yang telan Anda isi sebelumnya. Hasilnya adalah ['hasilnya disini'].
""");

    return buffer.toString();
  }

  @override
  void onInit() {
    super.onInit();
    _loadUser();
    _resolveArguments();
  }

  void _loadUser() {
    final userData = localStorage.readData('username');
    if (userData != null) {
      final user = jsonDecode(userData);
      userId = user['id'];
    }
  }

  void _resolveArguments() {
    final args = Get.arguments as Map<String, dynamic>;

    if (args['fromHistory'] == true) {
      isFromHistory.value = true;
      analysisResult.value = args['result']['hasil'];
    } else {
      final sections = List<Section>.from(args['sections']);
      analyzeWithAI(sections);
    }
  }

  Future<void> analyzeWithAI(List<Section> sections) async {
    try {
      isLoading.value = true;

      final prompt = buildPrompt(sections);

      final response = await OpenAI.instance.chat.create(
        model: 'gpt-4o-mini',
        messages: [
          OpenAIChatCompletionChoiceMessageModel(
            role: OpenAIChatMessageRole.user,
            content: [
              OpenAIChatCompletionChoiceMessageContentItemModel.text(prompt),
            ],
          ),
        ],
      );

      final result = response.choices.first.message.content?.first.text ?? '';

      analysisResult.value = result;

      await DBHelper.instance.insertScreeningResult(
        idUser: userId,
        hasil: result,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
