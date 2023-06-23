import 'package:flutter/material.dart';
//lib_file
import 'package:time_manager_app/login_page/login_page_styled_text.dart';
import 'package:time_manager_app/login_page/login_page_styled_text_filed.dart';
import 'package:time_manager_app/time_manager_page/time_manager_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Time Manager',
              style: TextStyle(fontSize: 50),
            ),
            const SizedBox(height: 50),
            const LoginPageStyledText('メールアドレス'),
            const SizedBox(height: 20),
            const LoginPageStyledTextField('メールアドレスを入力してください'),
            const SizedBox(height: 20),
            const LoginPageStyledText('パスワード'),
            const SizedBox(height: 20),
            const LoginPageStyledTextField('パスワードを入力してください'),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TimeManagerPage(),
                    ));
              },
              child: const Text('ログイン'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('新規登録'),
            )
          ],
        ),
      ),
    );
  }
}
