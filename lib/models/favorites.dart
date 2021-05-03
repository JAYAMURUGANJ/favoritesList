import 'package:flutter/material.dart';

import 'food.dart';

/// The [Favorites] class holds a list of favorite items saved by the user.
class Favorites extends ChangeNotifier {
  final List<Food> _favoriteItems = [];

  List<Food> get items => _favoriteItems;

  void add(Food food) {
    _favoriteItems.add(food);
    notifyListeners();
  }

  void remove(Food food) {
    _favoriteItems.remove(food);
    notifyListeners();
  }
}
