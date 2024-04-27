import 'package:news_app_kalpas/core/usecase/usecase.dart';
import 'package:news_app_kalpas/features/home/domain/entity/news_entity.dart';
import 'package:news_app_kalpas/features/home/domain/repository/home_repository.dart';

class FetchFavNewsUsecase extends Usecase<List<NewsDataEntity>, void> {
  final HomeRepository _repository;

  FetchFavNewsUsecase(this._repository);

  @override
  Future<List<NewsDataEntity>> call(params) async {
    return await _repository.getFavoriteArticles();
  }
}
