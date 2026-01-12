import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidup_fit/common/widgets/question_card.dart';
import 'package:hidup_fit/pages/screening/controllers/screening_controller.dart';

class ScreeningView extends GetView<ScreeningController> {
  const ScreeningView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Screening Kesehatan")),
      backgroundColor: const Color(0xFFF2F2F2),
      body: SafeArea(
        child: Obx(() {
          return Column(
            children: [
              // ================= HEADER =================
              LinearProgressIndicator(
                value: controller.progress,
                minHeight: 6,
              ),

              Text(
                controller.currentSection.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ).paddingSymmetric(vertical: 12),

              // ================= CONTENT =================
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(bottom: 16),
                  children: controller.currentSection.questions.map((q) {
                    final showError = q.answer == null && !controller.isCurrentSectionValid;

                    return QuestionCard(
                      question: q,
                      showError: showError,
                      onChanged: (value) {
                        controller.setAnswer(q.id, value!);
                      },
                    );
                  }).toList(),
                ),
              ),

              // ================= FOOTER (STICKY) =================
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // ===== KEMBALI =====
                    if (controller.currentSectionIndex.value > 0)
                      OutlinedButton(
                        onPressed: controller.prevSection,
                        child: const Text("Kembali").paddingSymmetric(horizontal: 12),
                      )
                    else
                      const SizedBox(width: 88), // placeholder biar rapi

                    const Spacer(),

                    // ===== SELANJUTNYA / HASIL =====
                    ElevatedButton(
                      onPressed: controller.isCurrentSectionValid
                          ? () {
                              if (controller.currentSectionIndex.value == controller.totalSections - 1) {
                                controller.seeResult();
                              } else {
                                controller.nextSection();
                              }
                            }
                          : null,
                      child: Text(
                        controller.currentSectionIndex.value == controller.totalSections - 1 ? "Lihat Hasil" : "Selanjutnya",
                      ).paddingSymmetric(horizontal: 12),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
