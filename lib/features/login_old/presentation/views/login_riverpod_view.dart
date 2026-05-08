import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:session_3/core/assets.dart';
import 'package:session_3/core/navigation/router.dart';
import 'package:session_3/features/login_old/presentation/state/login_notifier.dart';
import 'package:session_3/features/login_old/presentation/widgets/password_textfield.dart';
import 'package:session_3/features/login_old/presentation/widgets/social_widget.dart';
import 'package:session_3/l10n/app_localizations.dart';

class LoginRiverpodView extends StatelessWidget {
  const LoginRiverpodView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [Image.asset(Assets.loginBackground), BodyWidget()],
      ),
    );
  }
}

// Cambiar a ConsumerStatefulWidget para usar Riverpod
// StatefulWidget -> ConsumerStatefulWidget
// StatelessWidget -> ConsumerWidget

class BodyWidget extends ConsumerWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  BodyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          decoration: BoxDecoration(color: Colors.white),
          padding: EdgeInsets.symmetric(
            horizontal: constraints.maxWidth > 600
                ? (constraints.maxWidth - 600) / 2 + 24
                : 24,
            vertical: 40,
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HeaderWidget(),
              const SizedBox(height: 24),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email Address',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              PasswordTextfield(passwordController: passwordController),
              const SizedBox(height: 16),
              Text(
                AppLocalizations.of(context)!.forgot_password,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF006FFD),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF006FFD)),
                ),
                onPressed: () async {
                  /* Provider.of<LoginProvider>(
                    context,
                    listen: false,
                  ).updateTitle('Haciendo login...');*/

                  final email = emailController.text;
                  final password = passwordController.text;

                  ref
                      .read(loginRiverpodProvider.notifier)
                      .login(email, password);

                  /* if (logged) {
                    //  context.go('/dashboard');
                  }*/

                  // Solo leer valores para ejecutar funciones
                },
                child: Text('Login', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a member? '),
                  Image.asset(Assets.loginBackground, width: 16, height: 16),
                  InkWell(
                    onTap: () {
                      context.goNamed(Routes.register);
                    },
                    child: Text(
                      'Register now',
                      style: TextStyle(
                        color: Color(0xFF006FFD),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              Text.rich(
                TextSpan(
                  text: 'Not a member?  ',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                  children: [
                    TextSpan(
                      text: 'Register now',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('Navigate to registration page');
                        },
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Not a member?  ',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                  children: [
                    TextSpan(
                      text: 'Register now',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.goNamed(Routes.register);
                        },
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Divider(),
              SizedBox(height: 24),
              Text('Or continue with', textAlign: TextAlign.center),
              SizedBox(height: 16),
              SocialRow(),
            ],
          ),
        );
      },
    );
  }
}

class SocialRow extends StatelessWidget {
  const SocialRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialWidget.google(),
        SizedBox(width: 12),
        SocialWidget.apple(),
        SizedBox(width: 12),
        SocialWidget.facebook(),
      ],
    );
  }
}

class MovementsWidget extends StatelessWidget {
  const MovementsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: flujoMovimientos(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(
            'Movimiento: ${snapshot.data}',
            style: TextStyle(fontSize: 24),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

class HeaderWidget extends ConsumerWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final title = Provider.of<LoginProvider>(context).title;

    final state = ref.watch(
      loginRiverpodProvider,
    ); // Leer valores y actualizar UI

    final title = state.title;
    final logged = state.logged;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (logged) {
        // Navegar a otra pantalla
        context.go('/dashboard');
      }
    });

    return Text(
      'Riverpod $title',
      style: TextStyle(
        fontSize: 24,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

Stream<double> flujoMovimientos() async* {
  yield 5;
  await Future.delayed(Duration(seconds: 2));
  yield -120000.0; // retiro
  await Future.delayed(Duration(seconds: 1));
  yield -30000.0; // pago
  await Future.delayed(Duration(seconds: 1));
  yield 50000.0; // pago
  await Future.delayed(Duration(seconds: 1));
  yield -30000.0; // pago
  await Future.delayed(Duration(seconds: 1));
  yield -50000.0; // pago
}
