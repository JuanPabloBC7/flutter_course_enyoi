import 'package:session_3/features/login/domain/entities.dart/user.dart';

abstract class AuthenticationRepository {
  Future<void> signInWithGoogle();
  Future<void> signOut();
  Future<bool> isSignedIn();
  Future<String> getUserEmail();
  Future<bool> logOut();
  Future<bool> registerWithEmailAndPassword(String email, String password);
  Future<String> getAccessToken();
  Future<User> signIUpWithEmailAndPassword(String email, String password);
}
