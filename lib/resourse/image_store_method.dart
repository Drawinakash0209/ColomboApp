import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

import '../model/diary.dart';

class ImageStoreMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> imageToStorage(Uint8List file) async {
    String id = const Uuid().v1();
    Reference ref = _storage.ref().child('diaries').child(id);

    UploadTask uploadTask = ref.putData(file);

    TaskSnapshot downloadUrl = await uploadTask;
    String url = await downloadUrl.ref.getDownloadURL();
    return url;
  }

  Future<String> addDiary(
      String date, String place, String experiance, Uint8List file) async {
    String res = "Some error Occured";
    try {
      String imageUrl = await imageToStorage(file);
      String id = const Uuid().v1();
      diary d = diary(
        id: id,
        date: date,
        place: place,
        experience: experiance,
        imageUrl: imageUrl,
        datePublished: DateTime.now(),
      );
      _firestore.collection('diaries').doc(id).set(
            d.toJson(),
          );

      res = "Diary Added Successfully";
    } catch (e) {
      res = e.toString();
    }
    return res; // Add return statement here
  }
}
