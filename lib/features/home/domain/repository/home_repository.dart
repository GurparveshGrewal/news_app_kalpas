import 'package:news_app_kalpas/features/home/domain/entity/news_entity.dart';

abstract class HomeRepository {
  Future<List<NewsDataEntity>> getNewsArticles();

  Future<List<NewsDataEntity>> getFavoriteArticles();
}
