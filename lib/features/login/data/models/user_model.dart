import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart'; 

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required int id,
    required String username,
    required String email,
    required String firstName,
    required String lastName,
    required String gender,
    required String image,
    required String accessToken,
    required String newId,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}