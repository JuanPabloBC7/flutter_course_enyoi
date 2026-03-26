import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:session_3/app_colors.dart';
import 'package:session_3/core/environment/env.dart';
import 'package:session_3/core/local_storage.dart';
import 'package:session_3/core/navigation/router.dart';
import 'package:session_3/l10n/app_localizations.dart';

void runProject() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Env.initialize();
  await LocalStorage().init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
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
    );
  }
}
