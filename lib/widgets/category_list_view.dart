import 'package:flutter/material.dart';

import '../model/savedcategoriesList.dart';



class SavedCategories extends StatefulWidget {
  const SavedCategories({super.key});

  @override
  State<SavedCategories> createState() => _SavedCategoriesState();
}

class _SavedCategoriesState extends State<SavedCategories> {
  int currentSelect =  0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height : 30,// Wrap ListView.builder with Expanded
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length, // Make sure to define itemCount
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              currentSelect = index;
            });
          },
          child: Container(
            margin: EdgeInsets.only(left:  30),
            child: Text(
              categoryList[index],
              style: TextStyle(
                fontSize:  16,
                fontWeight: FontWeight.w500,
                // Optional styling change
              ),
            ),
          ),
        ),
      ),
    );
  }
}

