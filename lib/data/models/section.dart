import 'package:hidup_fit/data/models/question.dart';

class Section {
  final int id;
  final String title;
  final List<Question> questions;

  Section({
    required this.id,
    required this.title,
    required this.questions,
  });
}
