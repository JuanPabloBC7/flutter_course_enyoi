class CreditResult {
  final bool approved;
  final int amount;

  CreditResult._({required this.approved, required this.amount});

  factory CreditResult.approved({required int amount}) {
    if (amount <= 0) {
      throw ArgumentError(
        'Amount must be greater than zero for approved credit.',
      );
    }
    return CreditResult._(approved: true, amount: amount);
  }
  factory CreditResult.denied() {
    return CreditResult._(approved: false, amount: 0);
  }
}
