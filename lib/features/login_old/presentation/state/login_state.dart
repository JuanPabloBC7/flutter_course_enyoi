abstract base class LoginState {
  final String title;
  final bool logged;

  LoginState({required this.title, required this.logged});
}

final class LoginInitialState extends LoginState {
  LoginInitialState() : super(title: 'Login', logged: false);
}

final class LoginLoadingState extends LoginState {
  LoginLoadingState() : super(title: 'Haciendo login...', logged: false);
}

final class LoginCheckingCacheState extends LoginState {
  LoginCheckingCacheState()
    : super(title: 'Verificando sesión...', logged: false);
}

final class LoginSuccessState extends LoginState {
  final String userName;

  LoginSuccessState(this.userName)
    : super(title: 'Bienvenido $userName', logged: true);
}

final class LoginErrorState extends LoginState {
  final String errorMessage;

  LoginErrorState(this.errorMessage)
    : super(title: errorMessage, logged: false);
}
