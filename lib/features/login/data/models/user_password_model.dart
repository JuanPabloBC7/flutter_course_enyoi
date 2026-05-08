import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_password_model.freezed.dart';
part 'user_password_model.g.dart';

@freezed
abstract class UserPasswordModel with _$UserPasswordModel {
  const factory UserPasswordModel({
    @JsonKey(name: 'username') required String email,
    required String password,
  }) = _UserPasswordModel;

  factory UserPasswordModel.fromJson(Map<String, dynamic> json) =>
      _$UserPasswordModelFromJson(json);
}
