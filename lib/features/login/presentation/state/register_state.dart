class RegisterForm {
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final String password;

  RegisterForm({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.password,
  });

  RegisterForm copyWith({
    String? firstName,
    String? lastName,
    String? phone,
    String? email,
    String? password,
  }) {
    return RegisterForm(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RegisterForm &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.phone == phone &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        lastName.hashCode ^
        phone.hashCode ^
        email.hashCode ^
        password.hashCode;
  }

  @override
  String toString() {
    return 'RegisterForm(firstName: $firstName, lastName: $lastName, phone: $phone, email: $email, password: $password)';
  }
}

class RegisterState {
  final RegisterForm form;

  RegisterState({required this.form});

  RegisterState copyWith({RegisterForm? form}) {
    return RegisterState(form: form ?? this.form);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RegisterState && other.form == form;
  }

  @override
  int get hashCode {
    return form.hashCode;
  }

  @override
  String toString() {
    return 'RegisterState(form: $form)';
  }
}
