import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state_freezed.freezed.dart';

@freezed
abstract class RegisterForm with _$RegisterForm {
  const factory RegisterForm({
    required String firstName,
    required String lastName,
    required String phone,
    required String email,
    required String password,
  }) = _RegisterForm;
}

@freezed
abstract class RegisterState with _$RegisterState {
  const factory RegisterState({required RegisterForm form}) = _RegisterState;
}
