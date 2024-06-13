import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/utils.dart';

class DiaryFormScreen extends StatefulWidget {
  const DiaryFormScreen({Key? key}) : super(key: key);

  @override
  State<DiaryFormScreen> createState() => _DiaryFormScreenState();
}

class _DiaryFormScreenState extends State<DiaryFormScreen> {
  Uint8List? _file;
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
                  Uint8List? file = await pickImage(
                    ImageSource.camera,
                  );
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
                  Uint8List? file = await pickImage(
                    ImageSource.gallery,
                  );
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
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          const Text(
            'Diary Form',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Date",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue)),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(left: 5.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Enter the date",
                ),
              ),
            ),
            SizedBox(height: 20),
            Text("Place",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue)),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(left: 5.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Enter the place",
                ),
              ),
            ),
            SizedBox(height: 20),
            Text("Experience",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue)),
            SizedBox(height: 10),
            Container(
              height: 300, // Adjust height as needed for 15 lines
              padding: const EdgeInsets.only(left: 5.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const TextField(
                maxLines: 15,
                decoration: InputDecoration(
                  hintText: "Enter your experience",
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              onPressed: () => _imageSelect(context),
              icon: Icon(Icons.photo_camera),
              iconSize: 40,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
