import 'package:session_3/features/login_old/data/repositories/authentication_repository_impl.dart';
import 'package:session_3/features/login_old/domain/repositories/authentication_repository.dart';

class LogOutUseCase {
  final AuthenticationRepository _authenticationRepository;

  LogOutUseCase({AuthenticationRepository? authenticationRepository})
    : _authenticationRepository =
          authenticationRepository ?? AuthenticationRepositoryImpl();

  Future<void> call() async {
    // Lógica adicional antes de cerrar sesión, si es necesario
    return _authenticationRepository.signOut();
  }
}
