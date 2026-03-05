// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get app_title => 'My Banking App';

  @override
  String get forgot_password => 'Forgot password?';

  @override
  String get login => 'Login';

  @override
  String get balance => 'Available balance';

  @override
  String get transfer => 'Transfer';

  @override
  String get insufficient_funds => 'Insufficient funds';

  @override
  String get generic_error => 'An error occurred. Please try again.';
}
