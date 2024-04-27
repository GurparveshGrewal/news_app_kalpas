class NewsDataEntity {
  final String title;
  final String description;
  final DateTime publishedAt;
  final String content;
  final bool isFavorite;
  final String? author;
  final String? imageURL;

  NewsDataEntity({
    required this.author,
    required this.title,
    required this.description,
    required this.publishedAt,
    required this.content,
    required this.isFavorite,
    this.imageURL,
  });

  NewsDataEntity copyWith({
    bool? isFavoriteArticle,
  }) {
    return NewsDataEntity(
      isFavorite: isFavoriteArticle ?? isFavorite,
      author: author,
      title: title,
      description: description,
      publishedAt: publishedAt,
      content: content,
      imageURL: imageURL,
    );
  }
}
