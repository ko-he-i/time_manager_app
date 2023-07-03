import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_manager_app/time_manager_page/timer_list.dart';
//lib_file
//import 'package:time_manager_app/time_manager_page/timer_list.dart';
import 'package:time_manager_app/time_manager_page/timer_list_add_page.dart';
import 'package:time_manager_app/time_manager_page/timers_model_firestore.dart';

class TimeManagerPage extends StatefulWidget {
  const TimeManagerPage({super.key});

  @override
  State<TimeManagerPage> createState() => _TimeManagerPageState();
}

class _TimeManagerPageState extends State<TimeManagerPage> {
  List<String> timerList = [];

  void deleteDocument(String documentId) {
    // Firestoreインスタンスを取得
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // 削除するドキュメントの参照を取得
    DocumentReference docRef = firestore.collection('timers').doc(documentId);
    // ドキュメントを削除
    docRef
        .delete()
        .then((value) => print('Document deleted successfully!'))
        .catchError((error) => print('Failed to delete document: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (_) {
          MainModel model = MainModel();
          model.fetchTimers();
          return model;
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Time Manager'),
            // 戻るボタンを消す
            // automaticallyImplyLeading: false,
          ),
          body: Consumer<MainModel>(builder: (context, model, child) {
            final timers = model.timers;
            return ListView.builder(
              itemCount: timers.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  background: Container(
                    color: Colors.red,
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  onDismissed: (direction) {
                    final documentId =
                        timers[index].documentId; // タイマーのドキュメントIDを取得
                    deleteDocument(documentId); // ドキュメントを削除
                    setState(() {
                      timers.removeAt(index);
                    });
                  },
                  key: UniqueKey(),
                  child: TimerList(model.timers[index].name),
                );
              },
            );
          }),
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
        ),
      ),
    );
  }
}
