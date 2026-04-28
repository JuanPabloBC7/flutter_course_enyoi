import 'package:bloc/bloc.dart';
import 'package:session_3/features/login/domain/use_cases/is_loggeed_use_case.dart';
import 'package:session_3/features/login/domain/use_cases/login_use_case.dart';
import 'package:session_3/features/login/presentation/state/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;
  final IsLoggeedUseCase _isLoggeedUseCase;

  bool logged = false;

  LoginCubit({LoginUseCase? loginUseCase, IsLoggeedUseCase? isLoggeedUseCase})
    : _loginUseCase = loginUseCase ?? LoginUseCase(),
      _isLoggeedUseCase = isLoggeedUseCase ?? IsLoggeedUseCase(),
      super(LoginInitialState());

  Future<void> checkIfLogged() async {
    emit(LoginCheckingCacheState());

    final isLogged = await _isLoggeedUseCase.call();

    if (isLogged) {
      emit(LoginSuccessState('Usuario'));
    } else {
      emit(LoginInitialState());
    }
  }

  Future<bool> login(String email, String password) async {
    emit(LoginLoadingState());

    try {
      final user = await _loginUseCase.call(email, password);
      emit(LoginSuccessState(user.name));

      return true;
    } catch (e) {
      emit(LoginErrorState('Error al hacer login'));
      return false;
    }
  }

  void loginWithFacebook() {}
}
