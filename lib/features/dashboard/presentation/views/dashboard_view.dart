import 'package:flutter/material.dart';

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
    final buttonsText = ['Crédito', 'Perfil', 'Cerrar sesión'];

    final buttons = buttonsText
        .map((text) => SizedBox(child: Container(child: Text(text))))
        .toList();

    return Scaffold(
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: buttons),
      ),
    );
  }
}
