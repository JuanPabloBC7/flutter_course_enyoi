// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_password_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserPasswordModel _$UserPasswordModelFromJson(Map<String, dynamic> json) =>
    _UserPasswordModel(
      email: json['username'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$UserPasswordModelToJson(_UserPasswordModel instance) =>
    <String, dynamic>{
      'username': instance.email,
      'password': instance.password,
    };
