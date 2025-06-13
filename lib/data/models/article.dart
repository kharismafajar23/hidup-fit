class Article {
  final int? id;
  final String title;
  final String description;
  final String imageUrl;

  Article({
    this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      imageUrl: map['imageUrl'],
    );
  }
}
