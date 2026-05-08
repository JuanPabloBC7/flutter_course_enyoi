import 'package:session_3/features/login_old/data/repositories/authentication_repository_impl.dart';
import 'package:session_3/features/login_old/domain/repositories/authentication_repository.dart';

class IsLoggeedUseCase {
  final AuthenticationRepository _authenticationRepository;

  IsLoggeedUseCase({AuthenticationRepository? authenticationRepository})
    : _authenticationRepository =
          authenticationRepository ?? AuthenticationRepositoryImpl();

  Future<bool> call() async {
    return _authenticationRepository.isSignedIn();
  }
}
