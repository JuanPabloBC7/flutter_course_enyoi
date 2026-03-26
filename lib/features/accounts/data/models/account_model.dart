class AccountModel {
  final String userId;
  final String accountType;
  final String accountId;
  final double? balance;
  final double? overdraftLimit;

  AccountModel({
    required this.userId,
    required this.accountType,
    required this.accountId,
    required this.balance,
    required this.overdraftLimit,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      userId: json['userId'],
      accountType: json['accountType'],
      accountId: json['accountId'],
      balance: json['balance'],
      overdraftLimit: json['overdraftLimit'],
    );
  }
}
