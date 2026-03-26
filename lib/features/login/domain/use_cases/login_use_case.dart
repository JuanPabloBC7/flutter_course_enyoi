import 'package:session_3/features/login/data/repositories/authentication_repository_impl.dart';
import 'package:session_3/features/login/domain/entities.dart/user.dart';
import 'package:session_3/features/login/domain/repositories/authentication_repository.dart';

class LoginUseCase {
  final AuthenticationRepository _authenticationRepository;

  LoginUseCase({AuthenticationRepository? authenticationRepository})
    : _authenticationRepository =
          authenticationRepository ?? AuthenticationRepositoryImpl();

  Future<User> call(String email, String password) async {
    // Aquí iría la lógica de autenticación, por ejemplo, llamando a un repositorio
    // que se encargue de hacer la petición a un servidor.
    // Por simplicidad, vamos a simular una autenticación exitosa si el email y la contraseña no están vacíos.
    final user = await _authenticationRepository.signIUpWithEmailAndPassword(
      email,
      password,
    );

    await _authenticationRepository.saveSession(
      'fake_token',
    ); // Simulamos guardar una sesión

    user.newId =
        '12345'; // Ejemplo de uso del setter para modificar el ID del usuario

    return user;
  }
}
