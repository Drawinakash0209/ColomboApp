import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/locations_model.dart';
import '../provider/places_provider.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/search_input.dart';
import 'place_details_screen.dart';

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

  void updateList(String value) {
    setState(() {
      display_list = location_list
          .where((element) => element.location_name!
              .toLowerCase()
              .contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          searchinput(), // Include the searchinput widget here
          Expanded(
            child: FutureBuilder(
              future: context.read<PlacesProvider>().fetchAndSetData(context),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('An error occurred: ${snapshot.error}'),
                  );
                }
                var places = context.read<PlacesProvider>().places;
                return ListView.builder(
                  itemCount: places.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PlaceDetails(place: places[index]),
                        ),
                      ),
                      child: ListTile(
                        title: Text(places[index].name!),
                        subtitle: Text(places[index].category!),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
