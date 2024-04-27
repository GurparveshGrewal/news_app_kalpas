import 'package:news_app_kalpas/core/usecase/usecase.dart';
import 'package:news_app_kalpas/features/home/domain/entity/news_entity.dart';
import 'package:news_app_kalpas/features/home/domain/repository/home_repository.dart';

class AddNewsToFavsUsecase extends Usecase<void, AddNewsToFavsParams> {
  final HomeRepository _repository;

  AddNewsToFavsUsecase(this._repository);

  @override
  Future<void> call(AddNewsToFavsParams params) async {
    _repository.addToFavoriteArticles(params.news);
  }
}

class AddNewsToFavsParams {
  final NewsDataEntity news;

  AddNewsToFavsParams(this.news);
}
