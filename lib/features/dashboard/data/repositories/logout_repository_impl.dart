import 'package:session_3/core/dependencies.dart';
import 'package:session_3/features/dashboard/data/data_sources/local_logout_datasource.dart';
import 'package:session_3/features/dashboard/domain/repositories/logout_repository.dart';

class LogoutRepositoryImpl extends LogoutRepository {
  final LocalLogoutDatasource _localLogoutDatasource;

  LogoutRepositoryImpl({LocalLogoutDatasource? localLogoutDatasource})
    : _localLogoutDatasource =
          localLogoutDatasource ?? getIt<LocalLogoutDatasource>();

  @override
  Future<void> logOut() async {
    await _localLogoutDatasource.clearSession();
  }
}
