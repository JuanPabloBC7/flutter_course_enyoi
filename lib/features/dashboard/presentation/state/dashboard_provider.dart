import 'package:flutter/material.dart';
import 'package:session_3/features/dashboard/domain/use_cases/logout_use_case.dart';

class DashboardProvider extends ChangeNotifier {
  final LogoutUseCase _logoutUseCase;

  DashboardProvider({LogoutUseCase? logoutUseCase})
    : _logoutUseCase = logoutUseCase ?? LogoutUseCase();

  Future<void> logout() async {
    await _logoutUseCase.call();
  }
}
