import 'package:session_3/features/login/data/data_sources/remote_authetication_data_source.dart';
import 'package:session_3/features/login/data/models/user_password_model.dart';
import 'package:session_3/features/login/domain/entities.dart/user.dart';
import 'package:session_3/features/login/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final RemoteAutheticationDataSource _remoteAutheticationDataSource;

  AuthenticationRepositoryImpl({
    RemoteAutheticationDataSource? remoteAutheticationDataSource,
  }) : _remoteAutheticationDataSource =
           remoteAutheticationDataSource ?? RemoteAutheticationDataSource();

  @override
  Future<String> getAccessToken() {
    // TODO: implement getAccessToken
    throw UnimplementedError();
  }

  @override
  Future<String> getUserEmail() {
    // TODO: implement getUserEmail
    throw UnimplementedError();
  }

  @override
  Future<bool> isSignedIn() {
    // TODO: implement isSignedIn
    throw UnimplementedError();
  }

  @override
  Future<bool> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }

  @override
  Future<bool> registerWithEmailAndPassword(String email, String password) {
    // TODO: implement registerWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<User> signIUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final UserPasswordModel userPasswordModel = UserPasswordModel(
      email: email,
      password: password,
    );

    final userModel = await _remoteAutheticationDataSource
        .signIUpWithEmailAndPassword(userPasswordModel);

    return User.fromModel(userModel);
  }

  @override
  Future<void> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
