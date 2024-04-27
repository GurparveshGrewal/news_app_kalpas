part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeFetchNewsEvent extends HomeEvent {}

class HomeFetchFavNewsEvent extends HomeEvent {}

class HomeAddNewsToFavsEvent extends HomeEvent {
  final NewsDataEntity newsArticle;

  HomeAddNewsToFavsEvent(this.newsArticle);
}
