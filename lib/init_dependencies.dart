import 'package:get_it/get_it.dart';
import 'package:news_app_kalpas/core/wrappers/remote_services_wrapper.dart';
import 'package:news_app_kalpas/features/home/data/mappers/news_data_mapper.dart';
import 'package:news_app_kalpas/features/home/data/repository/home_repository_impl.dart';
import 'package:news_app_kalpas/features/home/domain/repository/home_repository.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  // wrappers
  serviceLocator.registerLazySingleton(() => RemoteServicesWrapper());

  //repo
  serviceLocator.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(
        serviceLocator(),
        serviceLocator(),
      ));

  // mapper
  serviceLocator.registerFactory(() => NewsDataMapper());
}
