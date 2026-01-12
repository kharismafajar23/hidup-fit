import 'package:get/get.dart';
import 'package:hidup_fit/data/data/screening_question.dart';
import 'package:hidup_fit/data/models/section.dart';
import 'package:hidup_fit/routes/app_routes.dart';

class ScreeningController extends GetxController {
  final sections = questionnaireSections.obs;
  final currentSectionIndex = 0.obs;

  Section get currentSection => sections[currentSectionIndex.value];

  int get totalSections => sections.length;

  double get progress => (currentSectionIndex.value + 1) / totalSections;

  bool get isCurrentSectionValid => currentSection.questions.every((q) => q.answer != null);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void setAnswer(int questionId, String value) {
    for (final section in sections) {
      for (final q in section.questions) {
        if (q.id == questionId) {
          q.answer = value;
          sections.refresh();
          return;
        }
      }
    }
  }

  void nextSection() {
    if (currentSectionIndex.value < totalSections - 1) {
      currentSectionIndex.value++;
    }
  }

  void prevSection() {
    if (currentSectionIndex.value > 0) {
      currentSectionIndex.value--;
    }
  }

  void seeResult() {
    // print(sections);
    Get.toNamed(
      AppRoutes.screeningResult,
      arguments: {
        'sections': sections.toList(),
      },
    );
  }
}
