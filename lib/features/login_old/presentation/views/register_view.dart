import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:session_3/features/login_old/presentation/state/register_notifier.dart';

class RegisterView extends ConsumerWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerState = ref.watch(
      registerNotifierProvider.select((s) => s.form),
    );
    print('deb: reconstrucción');
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Register Screen'),

          TextField(
            decoration: InputDecoration(labelText: 'Nombres '),
            onSubmitted: (value) => ref
                .read(registerNotifierProvider.notifier)
                .changeFirstName(value),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Apellidos '),
            onSubmitted: (value) => ref
                .read(registerNotifierProvider.notifier)
                .changeLastName(value),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Número de teléfono '),
            onSubmitted: (value) =>
                ref.read(registerNotifierProvider.notifier).changePhone(value),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Email'),
            onSubmitted: (value) =>
                ref.read(registerNotifierProvider.notifier).changeEmail(value),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
            onSubmitted: (value) => ref
                .read(registerNotifierProvider.notifier)
                .changePassword(value),
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Regisrarme '),
          ),
        ],
      ),
    );
  }
}
