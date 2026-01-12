import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:hidup_fit/data/models/question.dart';

class QuestionCard extends StatelessWidget {
  final Question question;
  final bool showError;
  final ValueChanged<String?> onChanged;

  const QuestionCard({
    super.key,
    required this.question,
    required this.showError,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(side: showError ? const BorderSide(color: Colors.red, width: 1.5) : BorderSide.none, borderRadius: BorderRadiusGeometry.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (showError) const Text("Wajib diisi", style: TextStyle(color: Colors.red)),
          Text(question.text),
          RadioListTile(
            value: "Ya",
            groupValue: question.answer,
            onChanged: onChanged,
            title: const Text("Ya"),
          ),
          RadioListTile(
            dense: true,
            value: "Tidak",
            groupValue: question.answer,
            onChanged: onChanged,
            title: const Text("Tidak"),
          ),
        ],
      ).paddingAll(12),
    );
  }
}
