import 'package:flutter/material.dart';

import '../services/database.dart';
import 'diary_form_screen.dart';

class MyDiaryPage extends StatefulWidget {
  const MyDiaryPage({super.key});

  @override
  State<MyDiaryPage> createState() => _MyDiaryPageState();
}

class _MyDiaryPageState extends State<MyDiaryPage> {
  Stream? diaryStream;

  getnotheload() async {
    diaryStream = await DatabaseMethods().getDiaries();
    setState(() {});
  }

  @override
  void initState() {
    getnotheload();
    super.initState();
  }

  Widget allDiaryDetails() {
    return StreamBuilder(
      stream: diaryStream, // Add the stream parameter here
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
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
                              Text(
                                "Date: ${snapshot.data.docs[index].data()['date']}",
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 20),
                              ),
                              Text(
                                "Place: ${snapshot.data.docs[index].data()['place']}",
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 20),
                              ),
                            ],
                          )),
                    ),
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
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
          )),
    );
  }
}
