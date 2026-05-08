sealed class LoginEvent {}

class CheckIfLoggedEvent extends LoginEvent {}

class LoginWithEmailEvent extends LoginEvent {
  final String email;
  final String password;

  LoginWithEmailEvent(this.email, this.password);
}

class LoginWithFacebookEvent extends LoginEvent {}

class LoginWithGoogleEvent extends LoginEvent {}
