import 'dart:convert';

import 'package:flutter/material.dart';

class Place {
  final int? id;
  final String? name;
  final String? description;
  final String? category;
  final double? latitude;
  final double? longitude;

  Place(this.id, this.name, this.description, this.category, this.latitude,
      this.longitude);
}

class PlacesProvider with ChangeNotifier {
  List<Place> _places = [];

  List<Place> get places => _places;

  Future<void> fetchAndSetData(context) async {
    try {
      final response =
          await DefaultAssetBundle.of(context).loadString('assets/places.json');

      final data = jsonDecode(response);

      List<Place> fetched = [];

      for (int i = 0; i < data.length; i++) {
        fetched.add(Place(
          data[i]['id'],
          data[i]['name'],
          data[i]['description'],
          data[i]['category'],
          data[i]['latitude'],
          data[i]['longitude'],
        ));
      }
      _places = fetched;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
    notifyListeners();
  }
}
