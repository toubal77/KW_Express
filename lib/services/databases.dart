import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kw_express/helper/api_app.dart';
import 'package:kw_express/models/detailRestaurant.dart';
import 'package:kw_express/models/restaurant.dart';

class DatabaseMethodes {
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
      print(e.toString());
    }
  }
}