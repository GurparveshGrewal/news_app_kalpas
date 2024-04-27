import 'package:news_app_kalpas/core/commons/exceptions/failure_exception.dart';
import 'package:news_app_kalpas/core/wrappers/remote_services_wrapper.dart';
import 'package:news_app_kalpas/features/home/data/mappers/news_data_mapper.dart';
import 'package:news_app_kalpas/features/home/domain/entity/news_entity.dart';
import 'package:news_app_kalpas/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final RemoteServicesWrapper _remoteServicesWrapper;
  final NewsDataMapper _newsDataMapper;

  HomeRepositoryImpl(
    this._remoteServicesWrapper,
    this._newsDataMapper,
  );

  final List<NewsDataEntity> _allNewsArticles = [];

  @override
  Future<List<NewsDataEntity>> getNewsArticles() async {
    try {
      if (_allNewsArticles.isEmpty) {
        await _fetchNews();
      }

      return _allNewsArticles;
    } catch (e) {
      throw FetchFromAPIFailure(e.toString());
    }
  }

  Future<void> _fetchNews() async {
    try {
      final rawArticles = await _remoteServicesWrapper.getNews();
      for (var news in rawArticles) {
        _allNewsArticles.add(_newsDataMapper.map(news));
      }
    } catch (e) {
      throw FetchFromAPIFailure(e.toString());
    }
  }

  @override
  Future<List<NewsDataEntity>> getFavoriteArticles() async {
    return _allNewsArticles
        .where((article) => article.isFavorite == true)
        .toList();
  }

  @override
  void addToFavoriteArticles(NewsDataEntity news) {
    int index = _allNewsArticles.indexOf(news);
    final updatedNews = news.copyWith(isFavoriteArticle: true);
    _allNewsArticles[index] = updatedNews;
  }
}
