import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kw_express/helper/api_app.dart';
import 'package:kw_express/models/detailRestaurant.dart';
import 'package:kw_express/models/detailRestoMenu.dart';
import 'package:kw_express/models/restaurant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseMethodes {
  Future setPets(List<String> pets) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('pets', pets);
  }

  Future<List<String>?> getPets() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var list = prefs.getStringList('pets');
    return list;
  }

  Future<List<Restaurant?>?> getRestaurant() async {
    try {
      List<Restaurant?> list = [];
      var url = Uri.parse(ApiApp.restaurant);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        print('seccus get restaurant');
        var data = json.decode(response.body);
        var rest = data["data"] as List;

        list =
            rest.map<Restaurant>((json) => Restaurant.fromJson(json)).toList();
        return list;
      } else {
        print('field get restaurant');
        print('Response status: ${response.statusCode}');
      }
    } catch (e) {
      print('field to try get restaurant');
      print(e.toString());
    }
  }

  Future<List<DetailRestaurant?>?> fetechdetailResto(String idResto) async {
    try {
      List<DetailRestaurant?> list = [];
      var url = Uri.parse(ApiApp.restaurantDetail);
      var response = await http.post(url, body: {
        'Resto': idResto,
      });

      if (response.statusCode == 200) {
        print('seccus fetch data restaurantDetail');
        var data = json.decode(response.body);
        var rest = data["data"] as List;

        list = rest
            .map<DetailRestaurant>((json) => DetailRestaurant.fromJson(json))
            .toList();

        return list;
      } else {
        print('field fetch data restaurantDetail');
        print('Response status: ${response.statusCode}');
      }
    } catch (e) {
      print('field to try restaurantDetail');
      print(e.toString());
    }
  }

  Future<List<DetailRestoMenu?>?> fetechdetailRestoMenu(
      String idResto, String idSpeciality) async {
    try {
      List<DetailRestoMenu?> list = [];
      var url = Uri.parse(ApiApp.menu);
      var response = await http.post(url, body: {
        'Resto': idResto,
        'Speciality': idSpeciality,
      });

      if (response.statusCode == 200) {
        print('seccus fetch data restaurantDetailMenu');

        var data = json.decode(response.body);
        var rest = data["data"] as List;

        list = rest
            .map<DetailRestoMenu>((json) => DetailRestoMenu.fromJson(json))
            .toList();

        return list;
      } else {
        print('field fetch data restaurantDetailMenu');
        print('Response status: ${response.statusCode}');
      }
    } catch (e) {
      print('field to try restaurantDetailMenu');
      print(e.toString());
    }
  }
}
