import 'package:get_it/get_it.dart';
import 'package:news_app_kalpas/core/wrappers/remote_services_wrapper.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  // wrappers
  serviceLocator.registerLazySingleton(() => RemoteServicesWrapper());
}
