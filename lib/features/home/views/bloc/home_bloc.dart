import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_app_kalpas/core/commons/exceptions/failure_exception.dart';
import 'package:news_app_kalpas/features/home/domain/entity/news_entity.dart';
import 'package:news_app_kalpas/features/home/domain/usecase/fetch_news_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FetchNewsUsecase _fetchNewsUsecase;

  HomeBloc({
    required FetchNewsUsecase fetchNewsUsecase,
  })  : _fetchNewsUsecase = fetchNewsUsecase,
        super(HomeInitial()) {
    on<HomeEvent>((event, emit) => emit(HomeLoadingState()));
    on<HomeFetchNewsEvent>(fetchNews);
  }

  Future<void> fetchNews(
      HomeFetchNewsEvent event, Emitter<HomeState> emit) async {
    try {
      final newsList = await _fetchNewsUsecase({});
      emit(HomeNewsFetchSuccessState(newsList));
    } on FetchFromAPIFailure catch (error) {
      emit(HomeNewsFetchFailureState(error.message));
    }
  }
}
