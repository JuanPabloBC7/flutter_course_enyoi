import 'package:session_3/features/dashboard/data/repositories/logout_repository_impl.dart';
import 'package:session_3/features/dashboard/domain/repositories/logout_repository.dart';

class LogoutUseCase {
  final LogoutRepository _logoutRepository;

  LogoutUseCase({LogoutRepository? logoutRepository})
    : _logoutRepository = logoutRepository ?? LogoutRepositoryImpl();

  Future<void> call() async {
    // Lógica adicional antes de cerrar sesión, si es necesario
    return _logoutRepository.logOut();
  }
}
