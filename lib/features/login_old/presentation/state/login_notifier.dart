import 'package:riverpod/legacy.dart';
import 'package:session_3/features/login_old/domain/use_cases/is_loggeed_use_case.dart';
import 'package:session_3/features/login_old/domain/use_cases/login_use_case.dart';
import 'package:session_3/features/login_old/presentation/state/login_state.dart';

final loginRiverpodProvider = StateNotifierProvider<LoginNotifier, LoginState>(
  (ref) => LoginNotifier(),
);

class LoginNotifier extends StateNotifier<LoginState> {
  final LoginUseCase _loginUseCase;
  final IsLoggeedUseCase _isLoggeedUseCase;

  LoginNotifier({
    LoginUseCase? loginUseCase,
    IsLoggeedUseCase? isLoggeedUseCase,
  }) : _loginUseCase = loginUseCase ?? LoginUseCase(),
       _isLoggeedUseCase = isLoggeedUseCase ?? IsLoggeedUseCase(),
       super(LoginInitialState());

  Future<void> checkIfLogged() async {
    state = LoginCheckingCacheState();

    final isLogged = await _isLoggeedUseCase.call();

    if (isLogged) {
      state = LoginSuccessState('Usuario');
    } else {
      state = LoginInitialState();
    }
  }

  Future<bool> login(String email, String password) async {
    state = LoginLoadingState();

    try {
      final user = await _loginUseCase.call(email, password);
      state = LoginSuccessState(user.name);

      return true;
    } catch (e) {
      print(e);

      state = LoginErrorState('Dummy Error al hacer login');
      return false;
    }
  }

  void loginWithFacebook() {}
}
