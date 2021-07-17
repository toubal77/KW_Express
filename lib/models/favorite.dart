import 'package:flutter/material.dart';
import 'package:kw_express/models/restaurant.dart';

class FavoriteResto extends ChangeNotifier {
  Map<String, Restaurant?> _items = {};

  void addItem(Restaurant? data, String title) {
    if (_items.containsKey(title)) {
      _items.remove(title);
    } else {
      _items.putIfAbsent(
        title,
        () => Restaurant(
          id_resto: data!.id_resto,
          nom_resto: data.nom_resto,
          img_profile: data.img_profile,
          img_cover: data.img_cover,
        ),
      );
      print('item added to favorites list');
      notifyListeners();
    }
  }

  Map<String, Restaurant?> get items {
    return {..._items};
  }

  void removeItem(Restaurant? data) {
    _items.remove(data);
    notifyListeners();

    print('item removeItem to favorites list');
  }

  bool itemIsFavorited(String? data) {
    if (_items.containsKey(data)) {
      return true;
    } else {
      return false;
    }
  }
}
