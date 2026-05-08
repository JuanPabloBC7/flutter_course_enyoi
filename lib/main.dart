import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:session_3/app_colors.dart';
import 'package:session_3/core/dependencies.dart';
import 'package:session_3/core/environment/env.dart';
import 'package:session_3/core/local_storage.dart';
import 'package:session_3/core/navigation/router.dart';
import 'package:session_3/core/utils/my_bloc_observer.dart';
import 'package:session_3/features/login_old/presentation/state/login_provider.dart';
import 'package:session_3/l10n/app_localizations.dart';

void runProject() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Env.initialize();
  await LocalStorage().init();
  await setupDependencies();
  Bloc.observer = MyBlocObserver();
  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginProvider()..checkIfLogged(),
      child: MaterialApp.router(
        theme: ThemeData(primaryColor: AppColors.primaryColor),
        title: Env.appName,
        supportedLocales: [const Locale('en', 'US'), const Locale('es', 'ES')],
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        routerConfig: router,
      ),
    );
  }
}
