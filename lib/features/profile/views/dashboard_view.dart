import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:session_3/core/navigation/router.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Perfil de usuario'),
            ElevatedButton(
              onPressed: () {
                context.goNamed(Routes.dashboard);
              },
              child: Text('Volver a dashboard '),
            ),
          ],
        ),
      ),
    );
  }
}
