import 'package:flutter/material.dart';

class AccountWidget extends StatelessWidget {
  final int balance;

  const AccountWidget(this.balance);

  @override
  Widget build(BuildContext context) {
    return Container(child: Text('Balance: $balance'));
  }
}
