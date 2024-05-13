import 'package:flutter/material.dart';

import '../widgets/detail_app_bar.dart';
import '../widgets/detail_bottom_bar.dart';

class DetailScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/detail1.jpg'),
          fit: BoxFit.cover,
          opacity: 0.7,
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: DetailAppBar(),
        ),
        bottomNavigationBar: DetailBottomBar(),
      ),
    );
  }

}