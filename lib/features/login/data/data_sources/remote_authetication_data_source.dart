import 'package:session_3/features/login/data/models/user_model.dart';
import 'package:session_3/features/login/data/models/user_password_model.dart';

class RemoteAutheticationDataSource {
  Future<UserModel> signIUpWithEmailAndPassword(
    UserPasswordModel userPasswordModel,
  ) async {
    final email = userPasswordModel.email;
    final password = userPasswordModel.password;

    // Simulamos una llamada a una API para registrar al usuario
    await Future.delayed(
      Duration(seconds: 2),
    ); // Simula el tiempo de respuesta de la API

    if (email == 'jomazao' && password == '123456') {
      // Aquí deberías implementar la lógica real para registrar al usuario con tu backend
      // Por ahora, simplemente devolvemos un UserModel simulado
      return UserModel(
        id: '123',
        email: userPasswordModel.email,
        name: 'Jose Manuel',
      );
    } else {
      throw Exception('Error al registrar el usuario. Credenciales inválidas.');
    }
  }
}
