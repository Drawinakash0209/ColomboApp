

import 'package:flutter/material.dart';

import '../pallate.dart';
import 'home_screen.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()));
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        leadingWidth: 100,
      ),
      body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Settings", style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          ),
          const SizedBox(height: 30,),
          Text("Account", style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          ),
          SizedBox(height: 20,),
          Container(
            width: double.infinity,
            child: Row(
                children: [
                  Image.asset('images/avatarlayout.png', width: 70, height: 70,),
                  const SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Joe Doe", style:
                        TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )
                        ,),
                      Text("Personal Account", style:
                      TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      )
                        ,)
                    ],
                  ),
                  const Spacer(),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(Icons.navigate_next),
                  ),
                ],

            ),

          ),
          const SizedBox(height: 40,),
      Text("Settings", style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
      ),
          const SizedBox(height:24,),
          Container(
            width: double.infinity,
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                      Icons.language,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(width: 20,),
                Text("Language", style: sBodyText,
                ),
                const Spacer(),
                Text("English", style:
                TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                ),
                const SizedBox(width: 10,),
                Icon(Icons.navigate_next),
              ],
            ),

          ),
          SizedBox(height: 20,),
          Container(
            width: double.infinity,
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.notifications,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(width: 20,),
                Text("Notifications", style: sBodyText,
                ),
                const Spacer(),
                Text("On", style:
                TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                ),
                const SizedBox(width: 10,),
                Icon(Icons.navigate_next),
              ],
            ),

          ),
          SizedBox(height: 20,),
          Container(
            width: double.infinity,
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.location_on,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(width: 20,),
                Text("Location", style: sBodyText,
                ),
                const Spacer(),
                Text("On", style:
                TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                ),
                const SizedBox(width: 10,),
                Icon(Icons.navigate_next),
              ],
            ),

          ),
          SizedBox(height: 20,),
          Container(
            width: double.infinity,
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.settings_display_sharp,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(width: 20,),
                Text("Display", style: sBodyText,
                ),
                const Spacer(),
                const SizedBox(width: 10,),
                Icon(Icons.navigate_next),
              ],
            ),

          ),
          SizedBox(height: 20,),
          Container(
            width: double.infinity,
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.help,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(width: 20,),
                Text("Help", style: sBodyText,
                ),
                const Spacer(),

                const SizedBox(width: 10,),
                Icon(Icons.navigate_next),
              ],
            ),

          ),
        ],
      ),
    ),);
  }
}
