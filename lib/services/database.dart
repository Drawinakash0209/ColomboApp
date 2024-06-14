import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future<Stream<QuerySnapshot>> getDiaries() async {
    return FirebaseFirestore.instance.collection('diaries').snapshots();
  }
}
