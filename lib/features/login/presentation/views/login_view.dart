import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:session_3/core/assets.dart';
import 'package:session_3/features/login/presentation/state/login_provider.dart';
import 'package:session_3/features/login/presentation/widgets/social_widget.dart';
import 'package:session_3/l10n/app_localizations.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginProvider>(
      create: (_) => LoginProvider()..checkIfLogged(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [Image.asset(Assets.loginBackground), BodyWidget()],
        ),
      ),
    );
  }
}

class BodyWidget extends StatefulWidget {
  const BodyWidget({super.key});

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  late bool showPassword;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    showPassword = false;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    MediaQuery.of(context).size.width;
    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant BodyWidget oldWidget) {
    showPassword = false;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
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
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                  suffixIcon: InkWell(
                    child: Icon(
                      showPassword ? Icons.visibility : Icons.visibility_off,
                    ),
                    onTap: () {
                      showPassword = !showPassword;
                      print('Toggle password visibility');
                      print('showPassword: $showPassword');

                      setState(() {});
                    },
                  ),
                ),
                obscureText: !showPassword,
              ),
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

                  final logged = await context.read<LoginProvider>().login(
                    email,
                    password,
                  );

                  if (logged) {
                    //  context.go('/dashboard');
                  }

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
                      print('Navigate to registration page');
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
                          print('Navigate to registration page');
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

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    //final title = Provider.of<LoginProvider>(context).title;
    final state = context
        .watch<LoginProvider>(); // Leer valores y actualizar UI

    final title = state.title;
    final logged = state.logged;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (logged) {
        // Navegar a otra pantalla
        context.go('/dashboard');
      }
    });

    return Text(
      title,
      style: TextStyle(
        fontSize: 24,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size.width;
    Theme.of(context).primaryColor;

    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color(0xFF006FFD)),
      ),
      onPressed: () {
        /* Provider.of<LoginProvider>(
          context,
          listen: false,
        ).updateTitle('Haciendo login...');*/
        context.read<LoginProvider>().updateTitle(
          'Haciendo login...',
        ); // Solo leer valores para ejecutar funciones
      },
      child: Text('Login', style: TextStyle(color: Colors.white)),
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
