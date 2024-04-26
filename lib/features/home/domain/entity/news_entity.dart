class NewsDataEntity {
  final String title;
  final String description;
  final DateTime publishedAt;
  final String content;
  final String? author;
  final String? imageURL;

  NewsDataEntity({
    required this.author,
    required this.title,
    required this.description,
    required this.publishedAt,
    required this.content,
    this.imageURL,
  });
}
