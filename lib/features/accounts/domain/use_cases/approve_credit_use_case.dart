import 'package:session_3/features/accounts/data/repositories/credit_repository_impl.dart';
import 'package:session_3/features/accounts/domain/entities/credit_result.dart';
import 'package:session_3/features/accounts/domain/repositories/credit_repository.dart';
import 'package:session_3/features/accounts/domain/services/calculate_credit_amount_service.dart';

class ApproveCreditUseCase {
  final CreditRepository _creditRepository;

  ApproveCreditUseCase({CreditRepository? creditRepository})
    : _creditRepository = creditRepository ?? CreditRepositoryImpl();

  Future<CreditResult> call({dynamic creditApplication}) async {
    if (creditApplication.status == 'approved') {
      final scoreEntity = await _creditRepository.getCreditScore(
        userName: creditApplication.name,
      );

      final payCapacity = await _creditRepository.getPayCapacity(
        userName: creditApplication.name,
      );

      final creditAmount = calculateCreditAmount(
        score: scoreEntity.score,
        payCapacity: payCapacity,
      );

      // CreditResult(approved: creditAmount > 0, amount: creditAmount);

      if (creditAmount > 0) {
        return CreditResult.approved(amount: creditAmount);
      } else {
        return CreditResult.denied();
      }
    } else {
      return CreditResult.denied();
    }
  }
}
