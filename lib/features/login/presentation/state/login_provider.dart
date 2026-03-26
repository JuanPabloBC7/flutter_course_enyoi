import 'package:flutter/material.dart';
import 'package:session_3/features/login/domain/use_cases/is_loggeed_use_case.dart';
import 'package:session_3/features/login/domain/use_cases/login_use_case.dart';

class LoginProvider extends ChangeNotifier {
  final LoginUseCase _loginUseCase;
  final IsLoggeedUseCase _isLoggeedUseCase;

  LoginProvider({
    LoginUseCase? loginUseCase,
    IsLoggeedUseCase? isLoggeedUseCase,
  }) : _loginUseCase = loginUseCase ?? LoginUseCase(),
       _isLoggeedUseCase = isLoggeedUseCase ?? IsLoggeedUseCase();

  String title = 'Login';

  bool logged = false;

  Future<void> checkIfLogged() async {
    title = 'Verificando sesión...';
    notifyListeners();

    final isLogged = await _isLoggeedUseCase.call();

    if (isLogged) {
      title = 'Bienvenido de nuevo';
      logged = true;
    } else {
      title = 'Por favor, inicia sesión';
      logged = false;
    }

    notifyListeners();
  }

  void updateTitle(String newTitle) {
    title = newTitle;
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    title = 'Haciendo login...';
    notifyListeners();

    try {
      final user = await _loginUseCase.call(email, password);
      title = 'Bienvenido ${user.name}';
      logged = true;

      notifyListeners();
      return true;
    } catch (e) {
      title = 'Error al hacer login';
      logged = false;
      notifyListeners();
      return false;
    }
  }

  void loginWithFacebook() {}
}
