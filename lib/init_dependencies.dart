import 'package:get_it/get_it.dart';
import 'package:news_app_kalpas/core/wrappers/remote_services_wrapper.dart';
import 'package:news_app_kalpas/features/home/data/mappers/news_data_mapper.dart';
import 'package:news_app_kalpas/features/home/data/repository/home_repository_impl.dart';
import 'package:news_app_kalpas/features/home/domain/repository/home_repository.dart';
import 'package:news_app_kalpas/features/home/domain/usecase/add_news_to_favs_usecase.dart';
import 'package:news_app_kalpas/features/home/domain/usecase/fetch_news_usecase.dart';
import 'package:news_app_kalpas/features/home/views/bloc/home_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  // wrappers
  serviceLocator.registerLazySingleton(() => RemoteServicesWrapper());

  //repo
  serviceLocator.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(
        serviceLocator(),
        serviceLocator(),
      ));

  // Blocs
  serviceLocator.registerLazySingleton(() => HomeBloc(
        fetchNewsUsecase: serviceLocator(),
        addNewsToFavsUsecase: serviceLocator(),
      ));

  // mapper
  serviceLocator.registerFactory(() => NewsDataMapper());

  // Usecases
  serviceLocator.registerFactory(() => FetchNewsUsecase(serviceLocator()));
  serviceLocator.registerFactory(() => AddNewsToFavsUsecase(serviceLocator()));
}
