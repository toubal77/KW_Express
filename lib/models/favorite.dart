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
    }
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
      isFavorite: !data.isFavorite,
    );

    var resto =
        favo!.indexWhere((element) => element!.nom_resto == res.nom_resto);
    print('uihoehgr ' + resto.toString());
    if (resto == -1) {
      favo.add(res);
      print('resto add to list');
    } else {
      favo.removeAt(resto);
      print('resto remove from list');
    }
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
}
