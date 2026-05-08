import 'package:get_it/get_it.dart';
import 'package:session_3/features/dashboard/data/data_sources/local_logout_datasource.dart';
import 'package:session_3/features/dashboard/data/repositories/logout_repository_impl.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // Aquí puedes registrar tus dependencias, por ejemplo:
  // getIt.registerSingleton<SomeService>(SomeServiceImpl());
  await initDashboardDependencies();
}

Future<void> initDashboardDependencies() async {
  // Aquí puedes registrar dependencias específicas para el dashboard, por ejemplo:
  // getIt.registerFactory<LogoutRepository>(() => LogoutRepositoryImpl());

  getIt.registerSingleton<LocalLogoutDatasource>(LocalLogoutDatasource());
  getIt.registerLazySingleton<LogoutRepositoryImpl>(
    () => LogoutRepositoryImpl(
      localLogoutDatasource: getIt<LocalLogoutDatasource>(),
    ),
  );
}
