import 'package:flutter/material.dart';
import 'package:session_3/features/login/domain/use_cases/login_use_case.dart';

class LoginProvider extends ChangeNotifier {
  final LoginUseCase _loginUseCase;
  LoginProvider({LoginUseCase? loginUseCase})
    : _loginUseCase = loginUseCase ?? LoginUseCase();

  String title = 'Login';

  void updateTitle(String newTitle) {
    title = newTitle;
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    title = 'Haciendo login...';
    notifyListeners();

    try {
      final user = await _loginUseCase.call(email, password);
      title = 'Bienvenido ${user.name}';
      notifyListeners();
    } catch (e) {
      title = 'Error al hacer login';
      notifyListeners();
      return;
    }
  }

  void loginWithFacebook() {}
}
