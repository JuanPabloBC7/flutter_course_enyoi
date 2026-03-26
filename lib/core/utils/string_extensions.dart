import 'package:session_3/features/accounts/domain/entities/account.dart';

extension AccountTypeExtension on String {
  AccountType get toAccountType {
    switch (this) {
      case 'savings':
        return AccountType.savings;
      case 'checking':
        return AccountType.checking;
      case 'credit':
        return AccountType.credit;
      case 'investment':
        return AccountType.investment;
      case 'loan':
        return AccountType.loan;
      default:
        throw Exception('Invalid account type: $this');
    }
  }
}
