import 'package:session_3/core/environment/env.dart';

abstract class ApiConsts {
  static final String base = Env.apiBaseUrl;
  static final String login = "$base/auth/login";
  static final String users = "$base/users";
}
