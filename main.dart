import 'package:flutter/material.dart';
//lib_file
import 'package:time_manager_app/login_page/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Time Manager',
      home: LoginPage(),
    );
  }
}
