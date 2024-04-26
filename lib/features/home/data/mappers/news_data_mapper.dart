import 'package:news_app_kalpas/features/home/domain/entity/news_entity.dart';

class NewsDataMapper {
  static const String _keyNameAuthor = 'author';
  static const String _keyNameTitle = 'title';
  static const String _keyNameDescription = 'description';
  static const String _keyNamePublishedAt = 'publishedAt';
  static const String _keyNameContent = 'content';
  static const String _keyNameUrlToImage = 'urlToImage';

  NewsDataEntity map(Map<String, dynamic> data) {
    return NewsDataEntity(
      author: data[_keyNameAuthor],
      title: data[_keyNameTitle],
      description: data[_keyNameDescription],
      publishedAt: DateTime.parse(data[_keyNamePublishedAt]),
      content: data[_keyNameContent],
      imageURL: data[_keyNameUrlToImage],
    );
  }
}
