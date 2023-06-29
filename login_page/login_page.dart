import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
//lib_file
import 'package:time_manager_app/login_page/login_page_styled_text.dart';
//import 'package:time_manager_app/login_page/login_page_styled_text_filed.dart';
import 'package:time_manager_app/time_manager_page/time_manager_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String newUserEmail = '';
  String newUserPassword = '';
  String infoText = '';
  String loginUserEmail = '';
  String loginUserPassword = '';

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
            //const LoginPageStyledTextField('メールアドレスを入力してください'),
            TextFormField(
              decoration: const InputDecoration(labelText: 'メールアドレス'),
              onChanged: (String value) {
                setState(() {
                  newUserEmail = value;
                });
              },
            ),
            const SizedBox(height: 20),
            const LoginPageStyledText('パスワード'),
            const SizedBox(height: 20),
            //const LoginPageStyledTextField('パスワードを入力してください'),
            TextFormField(
              decoration: const InputDecoration(labelText: 'パスワード'),
              obscureText: true,
              onChanged: (String value) {
                setState(() {
                  newUserPassword = value;
                });
              },
            ),
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
            ElevatedButton(
              onPressed: () async {
                try {
                  // メール/パスワードでユーザー登録
                  final FirebaseAuth auth = FirebaseAuth.instance;
                  final UserCredential result =
                      await auth.createUserWithEmailAndPassword(
                    email: newUserEmail,
                    password: newUserPassword,
                  );
                  final User user = result.user!;
                  setState(() {
                    infoText = '登録OK:${user.email}';
                  });
                } catch (e) {
                  setState(() {
                    infoText = '登録NG:${e.toString()}';
                  });
                }
              },
              child: const Text('新規登録'),
            ),
            Text(
              infoText,
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(labelText: 'メールアドレス'),
              onChanged: (String value) {
                setState(() {
                  loginUserEmail = value;
                });
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(labelText: 'パスワード'),
              obscureText: true,
              onChanged: (String value) {
                setState(() {
                  loginUserPassword = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  final FirebaseAuth auth = FirebaseAuth.instance;
                  final UserCredential result =
                      await auth.signInWithEmailAndPassword(
                    email: loginUserEmail,
                    password: loginUserPassword,
                  );
                  final User user = result.user!;
                  setState(() {
                    infoText = 'ログインOK:${user.email}';
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TimeManagerPage(),
                        ));
                  });
                } catch (e) {
                  setState(() {
                    infoText = 'ログインNG:${e.toString()}';
                  });
                }
              },
              child: const Text('ログイン'),
            ),
            Text(infoText),
          ],
        ),
      ),
    );
  }
}
