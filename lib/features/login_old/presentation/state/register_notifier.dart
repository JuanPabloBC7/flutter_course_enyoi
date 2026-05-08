import 'package:riverpod/legacy.dart';
import 'package:session_3/features/login_old/presentation/state/register_state_freezed.dart';

final registerNotifierProvider =
    StateNotifierProvider<RegisterNotifier, RegisterState>(
      (ref) => RegisterNotifier(),
    );

class RegisterNotifier extends StateNotifier<RegisterState> {
  RegisterNotifier()
    : super(
        RegisterState(
          form: RegisterForm(
            firstName: '',
            lastName: '',
            phone: '',
            email: '',
            password: '',
          ),
        ),
      );

  void changeFirstName(String firstName) {
    print('deb: Changing first name to: $firstName');
    state = state.copyWith(form: state.form.copyWith(firstName: firstName));
  }

  void changeLastName(String lastName) {
    print('deb: Changing last name to: $lastName');
    state = state.copyWith(form: state.form.copyWith(lastName: lastName));
  }

  void changePhone(String phone) {
    state = state.copyWith(form: state.form.copyWith(phone: phone));
  }

  void changeEmail(String email) {
    state = state.copyWith(form: state.form.copyWith(email: email));
  }

  void changePassword(String password) {
    state = state.copyWith(form: state.form.copyWith(password: password));
  }

  Future<void> register(String email, String password) async {
    // Simulate a registration process
    await Future.delayed(const Duration(seconds: 2));
    state = state.copyWith(
      form: state.form.copyWith(
        firstName: state.form.firstName,
        lastName: state.form.lastName,
        phone: state.form.phone,
        email: state.form.email,
        password: state.form.password,
      ),
    ); // Registration successful
    // Registration successful
  }
}
