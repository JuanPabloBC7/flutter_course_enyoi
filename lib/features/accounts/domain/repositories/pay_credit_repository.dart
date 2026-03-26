abstract class PayCreditRepository {
  Future<void> payCredit({required String userName, required double amount});
}
