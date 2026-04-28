import 'package:bloc/bloc.dart';
import 'package:session_3/features/login/domain/use_cases/is_loggeed_use_case.dart';
import 'package:session_3/features/login/domain/use_cases/login_use_case.dart';
import 'package:session_3/features/login/presentation/state/login_event.dart';
import 'package:session_3/features/login/presentation/state/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;
  final IsLoggeedUseCase _isLoggeedUseCase;

  LoginBloc({LoginUseCase? loginUseCase, IsLoggeedUseCase? isLoggeedUseCase})
    : _loginUseCase = loginUseCase ?? LoginUseCase(),
      _isLoggeedUseCase = isLoggeedUseCase ?? IsLoggeedUseCase(),
      super(LoginInitialState()) {
    on<LoginEvent>((event, emit) async {
      switch (event) {
        case CheckIfLoggedEvent():
          await _checkIfLogged(emit);
        case LoginWithEmailEvent(email: final email, password: final password):
          await _login(email, password, emit);
        case LoginWithFacebookEvent():
          // TODO: Handle this case.
          throw UnimplementedError();
        case LoginWithGoogleEvent():
          // TODO: Handle this case.
          throw UnimplementedError();
      }
    });
  }

  Future<void> _checkIfLogged(Emitter<LoginState> emit) async {
    emit(LoginCheckingCacheState());
    final isLogged = await _isLoggeedUseCase.call();

    if (isLogged) {
      emit(LoginSuccessState('Usuario'));
    } else {
      emit(LoginInitialState());
    }
  }

  Future<bool> _login(
    String email,
    String password,
    Emitter<LoginState> emit,
  ) async {
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

  void _loginWithFacebook() {}
}
