import 'package:session_3/core/consts.dart';
import 'package:session_3/features/accounts/data/models/account_model.dart';

enum AccountType { savings, checking, credit, investment, loan }

class Account {

  final String userId;
  final AccountType accountType;
  final String accountId;
  final double balance;
  final double overdraftLimit;
  

  bool isLocked = false;

  bool get canTransfer {
    return balance > 0 && !isLocked && isExchangeType;
  }

  bool get isExchangeType =>
      accountType == AccountType.savings || accountType == AccountType.checking;

  bool get isOverdraftAllowed => overdraftLimit> 0 && accountType == AccountType.checking;

 /*  int get overdraftLimit {
    if (accountType == AccountType.checking) {
      return (balance * Consts.overdraftLimitPercentage)
          .toInt(); // Ejemplo de límite de sobregiro para cuentas corrientes
    }
    return 0; // No se permite sobregiro para otros tipos de cuentas
  }*/

  /*
  // Con método:
  bool canTransfer() {
      return balance > 0 && !isLocked && isExchangeType;
    }
  */

  Account({
    required this.userId,
    required this.accountType,
    required this.accountId,
     this.overdraftLimit = 0,
    this.balance = Consts.defaultAccountBalance,
  });

  factory Account.fromModel({required AccountModel model}) {
    return Account(
      userId: model.userId,
      // Con método util:
      // accountType: toAccountType(model.accountType),
      // Con extensión:
      accountType: model.accountType.toAccountType,
      accountId: model.accountId,
      balance: model.balance ?? Consts.defaultAccountBalance,
    );
  }

  void transfer(double amount, Account toAccount) {
    switch (this.accountType) {
      case AccountType.savings:
        // TODO: Handle this case.
        throw UnimplementedError();
      case AccountType.checking:
        // TODO: Handle this case.
        throw UnimplementedError();
      case AccountType.credit:
        // TODO: Handle this case.
        throw UnimplementedError();
      case AccountType.investment:
        // TODO: Handle this case.
        throw UnimplementedError();
      case AccountType.loan:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }
}

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

AccountType toAccountType(String accountType) {
  switch (accountType) {
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
      throw Exception('Invalid account type: $accountType');
  }
}


