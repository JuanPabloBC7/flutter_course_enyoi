import 'package:session_3/core/environment/env.dart';
import 'package:session_3/main.dart';

void main(List<String> args) {
  Env.environment = Environment.development;
  runProject();
}
