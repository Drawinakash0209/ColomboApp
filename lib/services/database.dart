import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseMethods {
  Future<Stream<QuerySnapshot>> getDiaries() async {
    return FirebaseFirestore.instance.collection('diaries').snapshots();
  }

  Future updateDiary(String id, Map<String, dynamic> updateInfo) async {
    return await FirebaseFirestore.instance
        .collection('diaries')
        .doc(id)
        .update(updateInfo);
  }

  Future deleteDiary(String id) async {
    return await FirebaseFirestore.instance
        .collection('diaries')
        .doc(id)
        .delete();
  }

  Future<String> uploadImageToStorage(
      String childName, Uint8List file, bool isPost) async {
    Reference ref = FirebaseStorage.instance
        .ref()
        .child(childName)
        .child(DateTime.now().toIso8601String());

    UploadTask uploadTask = ref.putData(file);

    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();

    return downloadUrl;
  }
}
