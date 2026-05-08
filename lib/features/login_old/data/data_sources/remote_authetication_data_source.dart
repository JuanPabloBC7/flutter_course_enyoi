import 'package:dio/dio.dart';
import 'package:session_3/core/api_consts.dart';
import 'package:session_3/features/login/data/models/user_model.dart';
import 'package:session_3/features/login/data/models/user_password_model.dart';


class RemoteAutheticationDataSource {
  final dio = Dio();

  Future<UserModel> signIUpWithEmailAndPassword(
    UserPasswordModel userPasswordModel,
  ) async {

    final response = await dio.post(
      ApiConsts.login,
      data: userPasswordModel.toJson(),
    );

    print('Response status: ${response.statusCode}');
    print('Response data: ${response.data}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      return UserModel.fromJson(response.data);
    } else {
      throw Exception(
        'Error al registrar el usuario. Código de estado: ${response.statusCode}',
      );
    }

    // Simulamos una llamada a una API para registrar al usuario
    /* await Future.delayed(
      Duration(seconds: 2),
    ); 
    
    
    // Simula el tiempo de respuesta de la API

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
    }*/
  }
}
