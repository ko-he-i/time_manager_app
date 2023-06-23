import 'package:flutter/material.dart';

class LoginPageStyledText extends StatelessWidget {
  const LoginPageStyledText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 20),
    );
  }
}
