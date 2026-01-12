class Question {
  final int id;
  final String text;
  String? answer;

  Question({
    required this.id,
    required this.text,
    this.answer,
  });
}
