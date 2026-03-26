import 'package:flutter/material.dart';
import 'package:session_3/features/accounts/domain/entities/credit_application.dart';
import 'package:session_3/features/accounts/domain/use_cases/approve_credit_use_case.dart';

class CreditRequestProvider extends ChangeNotifier {
  final ApproveCreditUseCase _approveCreditUseCase;

  CreditRequestProvider({ApproveCreditUseCase? approveCreditUseCase})
    : _approveCreditUseCase = approveCreditUseCase ?? ApproveCreditUseCase();

  bool loading = false;
  int approvedAmount = 0;
  bool isApproved = false;
  bool requestSent = false;

  Future<void> sendCreditRequest(String name) async {
    loading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 2));

    final creditApplication = CreditApplication(name: name, status: 'approved');

    final creditResult = await _approveCreditUseCase.call(
      creditApplication: creditApplication,
    );

    isApproved = creditResult.approved;
    approvedAmount = creditResult.amount;
    requestSent = true;

    // Aquí iría la lógica para enviar la solicitud de crédito
    // Por ejemplo, podrías hacer una llamada a una API o realizar algún cálculo
    // Luego, podrías actualizar el estado y notificar a los listeners
    loading = false;
    notifyListeners();
  }
}
