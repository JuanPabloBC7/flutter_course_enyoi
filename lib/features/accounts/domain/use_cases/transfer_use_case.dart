import 'package:session_3/features/accounts/domain/entities/account.dart';

class TransferUseCase {

  final dynamic transferRepository = dynamic;

  
  Future<bool> call({
    required Account fromAccount,
    required Account toAccount,
    required double amount,
  }) async{



    final accountWithOverDraft = await transferRepository.getAccountOverdraft(fromAccount);



    if (amount <= fromAccount.overdraftLimit) {
      return true;
    }

    if (!fromAccount.canTransfer) {
      return false;
    }

    fromAccount.transfer(amount, toAccount);
    return true;
  }
}
