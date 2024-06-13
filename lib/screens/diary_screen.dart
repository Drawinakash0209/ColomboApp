import 'package:flutter/material.dart';

import 'diary_form_screen.dart';

class MyDiaryPage extends StatelessWidget {
  const MyDiaryPage({super.key});

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
      body: Container(),
    );
  }
}
