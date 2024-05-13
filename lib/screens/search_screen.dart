
import 'package:flutter/material.dart';

import '../model/locations_model.dart';
import '../pallate.dart';
import '../widgets/bottom_nav_bar.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  static List<LocationModel> location_list = [
    LocationModel("Viharamahadevi Park", 4.6),
    LocationModel("National Museum of Colombo", 4.4),
    LocationModel("Independence Memorial Hall", 4.3),
    LocationModel("Gangaramaya Temple", 4.7),
    LocationModel("Colombo Dutch Museum", 4.2),
    LocationModel("Mount Lavinia Beach", 4.8),
    LocationModel("Kelaniya Raja Maha Vihara", 4.5),
    LocationModel("Old Parliament Building", 4.1),
    LocationModel("Arcade Independence Square", 4.4),
    LocationModel("Beira Lake", 4.3),
  ];

  List<LocationModel> display_list = List.from(location_list);

  void updatelist(String value) {

    setState(() {
      display_list = location_list.where((element) => element.location_name!.toLowerCase().contains(value.toLowerCase())).toList();

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Padding(
        padding: EdgeInsets.only(
          top: 80.0,
          left: 20.0,
          right: 20.0,
          bottom: 20.0,
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Search for a location",
              style: kBodyText,
            ),
            SizedBox(
              height: 15.0,
            ),

            TextField(
              onChanged: (value)=> updatelist(value),
              style: TextStyle(fontSize: 16, fontWeight:FontWeight.normal, ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white70,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                hintText: "Eg: One Galle Face",
                prefixIcon: Icon(Icons.search, color: Colors.blue, ),
                hintStyle: TextStyle(color: Colors.black45),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: display_list.length,
                itemBuilder: (context, index) => ListTile(
                  contentPadding: EdgeInsets.all(8),
                  title: Text(
                    display_list[index].location_name!,
                    style: TextStyle(
                        color: Colors.black45, fontWeight: FontWeight.bold),
                  ),
                 trailing: Text(
                     '${display_list[index].location_rating!}', style: TextStyle(color: Colors.black26),
                 ),

                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
