import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:time_manager_app/timer_page/countdown_timer.dart';

class TimerList extends StatelessWidget {
  const TimerList(this.timerName, {super.key});

  final String timerName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 2,
      ),
      child: Card(
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return CountDownPage(timerName);
              }),
            );
          },
          child: ListTile(
            title: Text(timerName),
          ),
        ),
      ),
    );
  }
}
