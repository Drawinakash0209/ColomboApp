

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../model/place.dart';
import '../model/savedcategoriesList.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/category_list_view.dart';
import '../widgets/search_input.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          searchinput(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal:  30),
            child: OrientationBuilder(
              builder: (context, orientation) {
                double titleFontSize = orientation == Orientation.portrait ?  20.0 :  14.0;
                return Text(
                  'Visit the places you saved',
                  style: TextStyle(
                    fontSize: titleFontSize,
                  ),
                );
              },
            ),
          ),
          SizedBox(height:  8),
          SavedCategories(),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              child: OrientationBuilder(
                builder: (context, orientation) {
                  int crossAxisCount = orientation == Orientation.portrait ?  4 :  3;
                  return StaggeredGridView.countBuilder(
                    crossAxisSpacing:  16,
                    mainAxisSpacing:  16,
                    crossAxisCount: crossAxisCount,
                    itemCount: placeList.length,
                    staggeredTileBuilder: (index) => StaggeredTile.fit(crossAxisCount ~/  2),
                    itemBuilder: (context, index) => _buildPlaceCard(placeList[index]),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget _buildPlaceCard(Place place) {
    return Container(
      alignment: Alignment.bottomLeft,
      height: place.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(place.imageUrl),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:  8, vertical:  4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              place.title,
              style: TextStyle(
                color: Colors.white,
                fontSize:  16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              place.subTitle,
              style: TextStyle(
                color: Colors.white,
                fontSize:  14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
