import 'package:session_3/features/accounts/domain/entities/account.dart';
import 'package:session_3/features/accounts/domain/entities/overdraft.dart';

class AccountWithOverdraft {
  final Account account;
  final Overdraft overdraft;

  AccountWithOverdraft({required this.account, required this.overdraft});
}
