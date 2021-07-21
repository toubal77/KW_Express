import 'package:flutter/material.dart';

import 'package:kw_express/models/restaurant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteResto with ChangeNotifier {
  // Map<String, Restaurant?> _items = {};
  // Map<String, Restaurant?> get items {
  //   return {..._items};
  // }

  setFavorite(Restaurant? data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    //get string favorites

    final String? favorites = prefs.getString('favorite');
    List<Restaurant?>? favo = [];
    if (favorites != null) {
      favo = Restaurant.decode(favorites);
      print('gf dbfd' + favo.toString());
    }
    print('ujdfgth ' + favo.toString());
    var res = Restaurant(
      id_resto: data!.id_resto,
      nom_resto: data.nom_resto,
      map: data.map,
      adress: data.adress,
      wilaya: data.wilaya,
      dure: data.dure,
      img_cover: data.img_cover,
      img_profile: data.img_profile,
      service: data.service,
      num_tel: data.num_tel,
      isFavorite: true,
    );
    favo!.add(res);
    print('uihdeug  ' + favo.toString());
    // set String favorites
    final String encodeData = Restaurant.encode(favo);
    await prefs.setString('favorite', encodeData).then((value) {
      if (value) print('resto added with seccus to favorite list');
    });
  }

  Future<List<Restaurant?>?> getFavorite() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    //get string favorites

    final String? favorites = prefs.getString('favorite');
    final List<Restaurant?>? favo = Restaurant.decode(favorites!);
    return favo;
  }

  // void addItem(Restaurant? data, String title) {
  //   if (_items.containsKey(title)) {
  //     _items.remove(title);
  //   } else {
  //     _items.putIfAbsent(
  //       title,
  //       () => Restaurant(
  //         id_resto: data!.id_resto,
  //         nom_resto: data.nom_resto,
  //         map: data.map,
  //         adress: data.adress,
  //         wilaya: data.wilaya,
  //         dure: data.dure,
  //         img_cover: data.img_cover,
  //         img_profile: data.img_profile,
  //         service: data.service,
  //         num_tel: data.num_tel,
  //       ),
  //     );
  //     print('item added to favorites list');
  //     notifyListeners();
  //   }
  // }

  // void removeItem(Restaurant? data) {
  //   _items.remove(data);
  //   notifyListeners();

  //   print('item removeItem to favorites list');
  // }

  // bool itemIsFavorited(String? data) {
  //   if (_items.containsKey(data)) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
}
