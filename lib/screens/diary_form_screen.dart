import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../resourse/image_store_method.dart';
import '../utils/utils.dart';

class DiaryFormScreen extends StatefulWidget {
  const DiaryFormScreen({Key? key}) : super(key: key);

  @override
  State<DiaryFormScreen> createState() => _DiaryFormScreenState();
}

class _DiaryFormScreenState extends State<DiaryFormScreen> {
  Uint8List? _file;
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();

  bool _isloading = false;

  void postDiary() async {
    setState(() {
      _isloading = true;
    });

    try {
      String res = await ImageStoreMethods().addDiary(
        _dateController.text,
        _placeController.text,
        _experienceController.text,
        _file!,
      );
      if (res == "Diary Added Successfully") {
        setState(() {
          _isloading = false;
        });
        showSnackBar('saved', context);
      } else {
        setState(() {
          _isloading = false;
        });
        showSnackBar(res, context);
      }
    } catch (err) {
      showSnackBar(err.toString(), context);
    }
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

  _cancelImage() {
    setState(() {
      _file = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Diary Form',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              _file != null
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
                              child: Image.memory(
                                _file!,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 10,
                              right: 10,
                              child: IconButton(
                                icon: Icon(Icons.cancel, color: Colors.red),
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
              ElevatedButton(onPressed: postDiary, child: Text("Save")),
            ],
          ),
        ),
      ),
    );
  }
}
