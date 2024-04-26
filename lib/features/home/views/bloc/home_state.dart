part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeNewsFetchSuccessState extends HomeState {
  final List<NewsDataEntity> articles;

  HomeNewsFetchSuccessState(this.articles);
}

class HomeNewsFetchFailureState extends HomeState {
  final String errorMessage;

  HomeNewsFetchFailureState(this.errorMessage);
}
