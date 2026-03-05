import 'package:session_3/features/login/data/models/user_model.dart';

class User {
  final String id;
  final String email;
  final String name;

  User({required this.id, required this.email, required this.name});

  factory User.fromModel(UserModel userModel) {
    return User(email: userModel.email, id: userModel.id, name: userModel.name);
  }
}
