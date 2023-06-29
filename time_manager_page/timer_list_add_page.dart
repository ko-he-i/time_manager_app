import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TimerListAddPage extends StatefulWidget {
  const TimerListAddPage({super.key});

  @override
  State<TimerListAddPage> createState() => _TimerListAddPageState();
}

class _TimerListAddPageState extends State<TimerListAddPage> {
  String _text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('タイマーを追加する'),
      ),
      body: Container(
        padding: const EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _text,
              style: const TextStyle(color: Colors.blue),
            ),
            const SizedBox(height: 8),
            TextField(
              onChanged: (String value) {
                setState(() {
                  _text = value;
                });
              },
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  Navigator.of(context).pop((_text));
                  await FirebaseFirestore.instance
                      .collection('timers')
                      .add({'name': _text});
                },
                child: const Text('追加'),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('キャンセル'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
