import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../services/database.dart';
import '../utils/utils.dart';
import 'diary_form_screen.dart';

class MyDiaryPage extends StatefulWidget {
  const MyDiaryPage({super.key});

  @override
  State<MyDiaryPage> createState() => _MyDiaryPageState();
}

class _MyDiaryPageState extends State<MyDiaryPage> {
  Stream? diaryStream;
  Uint8List? _file;
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();

  getnotheload() async {
    diaryStream = await DatabaseMethods().getDiaries();
    setState(() {});
  }

  _cancelImage() {
    setState(() {
      _file = null;
    });
  }

  _imageSelect(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text("Select Image"),
          children: [
            SimpleDialogOption(
              padding: EdgeInsets.all(20.0),
              child: Text("Take a photo"),
              onPressed: () async {
                Navigator.of(context).pop();
                Uint8List? file = await pickImage(ImageSource.camera);
                if (file != null) {
                  setState(() {
                    _file = file;
                  });
                }
              },
            ),
            SimpleDialogOption(
              padding: EdgeInsets.all(20.0),
              child: Text("Choose from gallery"),
              onPressed: () async {
                Navigator.of(context).pop();
                Uint8List? file = await pickImage(ImageSource.gallery);
                if (file != null) {
                  setState(() {
                    _file = file;
                  });
                }
              },
            ),
            SimpleDialogOption(
              padding: EdgeInsets.all(20.0),
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    getnotheload();
    super.initState();
  }

  Widget allDiaryDetails() {
    return StreamBuilder(
      stream: diaryStream,
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: snapshot.data.docs.length,
          itemBuilder: (context, index) {
            var diary = snapshot.data.docs[index];
            return Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Material(
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Date: ${diary['date']}",
                            style: TextStyle(color: Colors.blue, fontSize: 20),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              ViewDiary(diary.id, diary);
                            },
                            child: Icon(
                              Icons.remove_red_eye,
                              color: Colors.blue,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              EditDiary(diary.id, diary);
                            },
                            child: Icon(
                              Icons.edit,
                              color: Colors.orange,
                            ),
                          ),
                          SizedBox(width: 5),
                          GestureDetector(
                            onTap: () async {
                              await DatabaseMethods().deleteDiary(diary.id);
                            },
                            child: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Place: ${diary['place']}",
                        style: TextStyle(color: Colors.blue, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DiaryFormScreen()));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Row(children: [
          Text(
            'My Diary',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
        child: Column(
          children: [
            Expanded(child: allDiaryDetails()),
          ],
        ),
      ),
    );
  }

  Future EditDiary(String diaryId, dynamic diaryData) => showDialog(
        context: context,
        builder: (context) {
          _dateController.text = diaryData['date'];
          _placeController.text = diaryData['place'];
          _experienceController.text = diaryData['experience'];

          return AlertDialog(
            content: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Edit Diary",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    // Create edit form here
                    Text(
                      "Date",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.only(left: 5.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: _dateController,
                        decoration: InputDecoration(
                          hintText: "Enter the date",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Place",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.only(left: 5.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: _placeController,
                        decoration: InputDecoration(
                          hintText: "Enter the place",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Experience",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 300, // Adjust height as needed for 15 lines
                      padding: const EdgeInsets.only(left: 5.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: _experienceController,
                        maxLines: 15,
                        decoration: InputDecoration(
                          hintText: "Enter your experience",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    diaryData['imageUrl'] != null
                        ? Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 20.0),
                                    height: 200,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Image.network(
                                      diaryData['imageUrl'],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    top: 10,
                                    right: 10,
                                    child: IconButton(
                                      icon:
                                          Icon(Icons.cancel, color: Colors.red),
                                      onPressed: _cancelImage,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : IconButton(
                            onPressed: () => _imageSelect(context),
                            icon: Icon(Icons.photo_camera),
                            iconSize: 60,
                            color: Colors.blue,
                          ),
                    SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () async {
                          Map<String, dynamic> updateInfo = {
                            'date': _dateController.text,
                            'place': _placeController.text,
                            'experience': _experienceController.text,
                          };

                          if (_file != null) {
                            String imageUrl = await DatabaseMethods()
                                .uploadImageToStorage(
                                    'diaryImage', _file!, true);
                            updateInfo['imageUrl'] = imageUrl;
                          }

                          await DatabaseMethods()
                              .updateDiary(diaryId, updateInfo);
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 15.0),
                        ),
                        child: Text(
                          'Save Changes',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );

  Future ViewDiary(String diaryId, dynamic diaryData) => showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "View Diary",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Date",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    diaryData['date'],
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Place",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    diaryData['place'],
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Experience",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    diaryData['experience'],
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 20),
                  diaryData['imageUrl'] != null
                      ? Container(
                          margin: const EdgeInsets.only(top: 20.0),
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.network(
                            diaryData['imageUrl'],
                            fit: BoxFit.cover,
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          );
        },
      );
}
