import 'package:session_3/features/accounts/data/data_sources.dart/credit_local_data_source.dart';
import 'package:session_3/features/accounts/data/data_sources.dart/credit_remote_data_source.dart';
import 'package:session_3/features/accounts/domain/entities/credit_score.dart';
import 'package:session_3/features/accounts/domain/repositories/credit_repository.dart';

class CreditRepositoryImpl extends CreditRepository {
  final CreditRemoteDataSource _creditRemoteDataSource =
      CreditRemoteDataSource();

  final CreditLocalDataSource _creditLocalDataSource = CreditLocalDataSource();

  @override
  Future<CreditScore> getCreditScore({required String userName}) async {
    final agifyModel = await _creditRemoteDataSource.getCreditScore(
      userName: userName,
    );

    final score =
        agifyModel.age * 12; // Ejemplo de conversión a puntaje de crédito

    final creditScore = CreditScore(score: score);

    return creditScore;
  }

  @override
  Future<int> getPayCapacity({required String userName}) async {
    return _creditLocalDataSource.getPayCapacity(userName: userName);
  }
}
