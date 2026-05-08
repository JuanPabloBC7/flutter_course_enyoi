import 'package:flutter_test/flutter_test.dart';
import 'package:session_3/features/dashboard/data/data_sources/local_logout_datasource.dart';
import 'package:session_3/features/dashboard/data/repositories/logout_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

class MockLocalLogoutDatasource extends Mock implements LocalLogoutDatasource {}

void main() {
  test('LogoutRepository should log out successfully', () {
    /// MOCK DE LOCAL LOGOUT DATASOURCE
    ///
    final mockLocalLogoutDatasource = MockLocalLogoutDatasource();

    when(
      () => mockLocalLogoutDatasource.clearSession(),
    ).thenAnswer((_) async => throw Exception('Error al limpiar sesión'));

    // Arrange
    final logoutRepository = LogoutRepositoryImpl(
      localLogoutDatasource: mockLocalLogoutDatasource,
    );

    // Act
    Future<void> logOutResult = logoutRepository.logOut();

    // Assert
    expect(logOutResult, throwsA(isA<Exception>()));
  });
}
