import 'package:session_3/features/login/domain/repositories/authentication_repository.dart';

class LogOutUseCase {
  final AuthenticationRepository _authenticationRepository;

  LogOutUseCase(this._authenticationRepository);

  Future<void> call() async {
    // Lógica adicional antes de cerrar sesión, si es necesario

    return _authenticationRepository.signOut();
  }
}
