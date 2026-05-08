// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_password_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserPasswordModel {

@JsonKey(name: 'username') String get email; String get password;
/// Create a copy of UserPasswordModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserPasswordModelCopyWith<UserPasswordModel> get copyWith => _$UserPasswordModelCopyWithImpl<UserPasswordModel>(this as UserPasswordModel, _$identity);

  /// Serializes this UserPasswordModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserPasswordModel&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'UserPasswordModel(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $UserPasswordModelCopyWith<$Res>  {
  factory $UserPasswordModelCopyWith(UserPasswordModel value, $Res Function(UserPasswordModel) _then) = _$UserPasswordModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'username') String email, String password
});




}
/// @nodoc
class _$UserPasswordModelCopyWithImpl<$Res>
    implements $UserPasswordModelCopyWith<$Res> {
  _$UserPasswordModelCopyWithImpl(this._self, this._then);

  final UserPasswordModel _self;
  final $Res Function(UserPasswordModel) _then;

/// Create a copy of UserPasswordModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? password = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserPasswordModel].
extension UserPasswordModelPatterns on UserPasswordModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserPasswordModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserPasswordModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserPasswordModel value)  $default,){
final _that = this;
switch (_that) {
case _UserPasswordModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserPasswordModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserPasswordModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'username')  String email,  String password)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserPasswordModel() when $default != null:
return $default(_that.email,_that.password);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'username')  String email,  String password)  $default,) {final _that = this;
switch (_that) {
case _UserPasswordModel():
return $default(_that.email,_that.password);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'username')  String email,  String password)?  $default,) {final _that = this;
switch (_that) {
case _UserPasswordModel() when $default != null:
return $default(_that.email,_that.password);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserPasswordModel implements UserPasswordModel {
  const _UserPasswordModel({@JsonKey(name: 'username') required this.email, required this.password});
  factory _UserPasswordModel.fromJson(Map<String, dynamic> json) => _$UserPasswordModelFromJson(json);

@override@JsonKey(name: 'username') final  String email;
@override final  String password;

/// Create a copy of UserPasswordModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserPasswordModelCopyWith<_UserPasswordModel> get copyWith => __$UserPasswordModelCopyWithImpl<_UserPasswordModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserPasswordModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserPasswordModel&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'UserPasswordModel(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class _$UserPasswordModelCopyWith<$Res> implements $UserPasswordModelCopyWith<$Res> {
  factory _$UserPasswordModelCopyWith(_UserPasswordModel value, $Res Function(_UserPasswordModel) _then) = __$UserPasswordModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'username') String email, String password
});




}
/// @nodoc
class __$UserPasswordModelCopyWithImpl<$Res>
    implements _$UserPasswordModelCopyWith<$Res> {
  __$UserPasswordModelCopyWithImpl(this._self, this._then);

  final _UserPasswordModel _self;
  final $Res Function(_UserPasswordModel) _then;

/// Create a copy of UserPasswordModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(_UserPasswordModel(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
