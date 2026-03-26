import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:session_3/core/navigation/router.dart';
import 'package:session_3/features/dashboard/presentation/state/dashboard_provider.dart';

class BaseView extends StatelessWidget {
  final String name;
  final Widget child;

  const BaseView({super.key, required this.name, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: child);
  }
}

class DashboardView extends StatelessWidget {
  static final name = 'DashboardView';

  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                context.goNamed(Routes.creditRequest);
              },
              child: Text('Crédito'),
            ),
            ElevatedButton(
              onPressed: () {
                context.goNamed(Routes.profile);
              },
              child: Text('Perfil'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<DashboardProvider>().logout();
                context.goNamed(Routes.login);
              },
              child: Text('Cerrar sesión'),
            ),
          ],
        ),
      ),
    );
  }
}
