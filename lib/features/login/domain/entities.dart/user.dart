import 'package:session_3/features/login/data/models/user_model.dart';

class User {
  final String id;
  final String email;
  final String name;
  final String surname;
  String _newId = '';

  String get fullName => '$name $surname';

  set newId(String newId) {
    _newId = '$newId-modified';
  }

  String get newId => _newId;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.surname,
  });

  factory User.fromModel(UserModel userModel) {
    return User(
      email: userModel.email,
      id: userModel.id,
      name: userModel.name,
      surname: '',
    );
  }
}
