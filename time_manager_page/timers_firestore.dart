import 'package:cloud_firestore/cloud_firestore.dart';

class Timers {
  Timers(DocumentSnapshot doc) {
    name = doc['name'];
    documentId = doc.id; // documentIdを追加
  }
  late String name;
  late String documentId; // documentIdを追加
}
