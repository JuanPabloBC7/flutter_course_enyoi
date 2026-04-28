import 'package:flutter/material.dart';

class PasswordTextfield extends StatefulWidget {
  const PasswordTextfield({super.key, required this.passwordController});

  final TextEditingController passwordController;

  @override
  State<PasswordTextfield> createState() => _PasswordTextfieldState();
}

class _PasswordTextfieldState extends State<PasswordTextfield> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.passwordController,
      decoration: InputDecoration(
        hintText: 'Password',
        border: OutlineInputBorder(),
        suffixIcon: InkWell(
          child: Icon(showPassword ? Icons.visibility : Icons.visibility_off),
          onTap: () {
            showPassword = !showPassword;
            print('Toggle password visibility');
            print('showPassword: $showPassword');

            setState(() {});
          },
        ),
      ),
      obscureText: !showPassword,
    );
  }
}
