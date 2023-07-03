import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:time_manager_app/time_manager_page/timers_firestore.dart';

// class MainModel extends ChangeNotifier {
//   //MainModel({super.key});
//   List<Timers> timers = [];

//   Future<void> fetchTimers() async {
//     final docs = await FirebaseFirestore.instance.collection('timers').get();

//     final timers = docs.docs.map((doc) => Timers(doc)).toList();
//     this.timers = timers;
//     notifyListeners();
//   }
// }

class MainModel extends ChangeNotifier {
  List<Timers> timers = [];

  StreamSubscription<QuerySnapshot>? timersStream;

  void fetchTimers() {
    timersStream = FirebaseFirestore.instance
        .collection('timers')
        .snapshots()
        .listen((QuerySnapshot snapshot) {
      timers = snapshot.docs.map((DocumentSnapshot doc) {
        return Timers(doc);
      }).toList();
      notifyListeners();
    });
  }

  @override
  void dispose() {
    timersStream?.cancel();
    super.dispose();
  }
}
