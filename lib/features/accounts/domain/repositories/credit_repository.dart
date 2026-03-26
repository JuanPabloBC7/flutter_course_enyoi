import 'package:session_3/features/accounts/domain/entities/credit_score.dart';

abstract class CreditRepository {
  Future<CreditScore> getCreditScore({required String userName});
  Future<int> getPayCapacity({required String userName});
}
