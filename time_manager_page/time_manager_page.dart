import 'package:flutter/material.dart';
//lib_file
import 'package:time_manager_app/time_manager_page/timer_list.dart';
import 'package:time_manager_app/time_manager_page/timer_list_add_page.dart';

class TimeManagerPage extends StatefulWidget {
  const TimeManagerPage({super.key});

  @override
  State<TimeManagerPage> createState() => _TimeManagerPageState();
}

class _TimeManagerPageState extends State<TimeManagerPage> {
  List<String> timerList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Manager'),
        // 戻るボタンを消す
        // automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: timerList.length,
        itemBuilder: (context, index) {
          return TimerList(timerList[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newTimerList = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return const TimerListAddPage();
            }),
          );
          if (newTimerList != null) {
            setState(() {
              timerList.add(newTimerList);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
