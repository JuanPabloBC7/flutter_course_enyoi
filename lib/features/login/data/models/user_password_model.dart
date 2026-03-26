class UserPasswordModel {
  final String email;
  final String password;

  UserPasswordModel({required this.email, required this.password});


  factory UserPasswordModel.fromEntity(Map<String, dynamic> json) {
    return UserPasswordModel(
      email: json['email'],
      password: json['password'],
    );
  }
  /// Todo: implement toJSON
  ///
  ///
}
