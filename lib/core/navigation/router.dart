import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:session_3/features/accounts/presentation/states/credit_request_provider.dart';
import 'package:session_3/features/accounts/presentation/views/credit_request_view.dart';
import 'package:session_3/features/dashboard/presentation/state/dashboard_provider.dart';
import 'package:session_3/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:session_3/features/login/presentation/state/login_bloc.dart';
import 'package:session_3/features/login/presentation/state/login_cubit.dart';
import 'package:session_3/features/login/presentation/state/login_event.dart';
import 'package:session_3/features/login/presentation/views/login_bloc_view.dart';
import 'package:session_3/features/login/presentation/views/login_cubit_view.dart';
import 'package:session_3/features/login/presentation/views/login_riverpod_view.dart';
import 'package:session_3/features/login/presentation/views/login_view.dart';
import 'package:session_3/features/login/presentation/views/register_view.dart';
import 'package:session_3/features/profile/views/dashboard_view.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      name: Routes.login,
      path: '/provider',
      builder: (context, state) => LoginView(),
    ),
    GoRoute(
      name: Routes.loginCubit,
      path: '/cubit',
      builder: (context, state) => BlocProvider<LoginCubit>(
        create: (_) => LoginCubit()..checkIfLogged(),
        child: const LoginCubitView(),
      ),
    ),
    GoRoute(
      name: Routes.loginBloc,
      path: '/bloc',
      builder: (context, state) => BlocProvider<LoginBloc>(
        create: (_) => LoginBloc()..add(CheckIfLoggedEvent()),
        child: const LoginBlocView(),
      ),
    ),
    GoRoute(
      name: Routes.loginRiverpod,
      path: '/',
      builder: (context, state) => const LoginRiverpodView(),
      routes: [
        GoRoute(
          name: Routes.register,
          path: '/register',
          builder: (context, state) => const RegisterView(),
        ),
      ],
    ),

    ShellRoute(
      builder: (context, state, child) => Scaffold(
        appBar: AppBar(
          title: Text('Enyoi Bank'),
          backgroundColor: Colors.green,
        ),
        body: Column(
          children: [
            Expanded(flex: 70, child: child),
            Expanded(flex: 10, child: Container(color: Colors.orange)),
            Expanded(flex: 10, child: Container(color: Colors.red)),
          ],
        ),
      ),
      routes: [
        GoRoute(
          name: Routes.dashboard,
          path: '/dashboard',
          builder: (context, state) =>
              ChangeNotifierProvider<DashboardProvider>(
                create: (_) => DashboardProvider(),
                child: DashboardView(),
              ),
          routes: [
            GoRoute(
              name: Routes.creditRequest,
              path: 'solicitud-credito',
              builder: (context, state) =>
                  ChangeNotifierProvider<CreditRequestProvider>(
                    create: (_) => CreditRequestProvider(),
                    child: CreditRequestView(),
                  ),
            ),
          ],
        ),
        GoRoute(
          name: Routes.profile,
          path: '/profile',
          builder: (context, state) => ProfileView(),
        ),
      ],
    ),
  ],
);

abstract class Routes {
  static const String login = 'login';
  static const String register = 'register';
  static const String loginCubit = 'login_cubit';
  static const String loginBloc = 'login_bloc';
  static const String loginRiverpod = 'login_riverpod';
  static const String dashboard = 'dashboard';
  static const String creditRequest = 'solicitud-credito';
  static const String profile = 'profile';
}
