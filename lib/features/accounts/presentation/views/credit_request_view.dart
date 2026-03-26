import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:session_3/features/accounts/presentation/states/credit_request_provider.dart';

class CreditRequestView extends StatelessWidget {
  CreditRequestView({super.key});
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CreditRequestProvider>();

    return Scaffold(
      appBar: AppBar(title: Text('Solicita tu crédito')),

      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Text('Ingresa tu nombre para calcular tu crédito'),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(hintText: 'Nombre'),
              ),
              ElevatedButton(
                onPressed: () {
                  state.sendCreditRequest(_nameController.text);
                },
                child: Text('Calcular crédito'),
              ),
            ],
          ),
          if (state.loading)
            Container(
              color: Colors.black.withAlpha(150),
              child: Center(
                child: CircularProgressIndicator(color: Colors.amber),
              ),
            ),

          if (!state.loading && state.isApproved)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('¡Crédito aprobado! Monto: \$${state.approvedAmount}'),
                TextButton(onPressed: () {}, child: Text('reintentar ')),
              ],
            ),
          if (!state.loading && !state.isApproved && state.requestSent)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('¡Crédito denegado!')],
            ),
        ],
      ),
    );
  }
}
