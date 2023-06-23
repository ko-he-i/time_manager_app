import 'package:flutter/material.dart';

class LoginPageStyledTextField extends StatelessWidget {
  const LoginPageStyledTextField(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: text,
        ),
      ),
    );
  }
}
