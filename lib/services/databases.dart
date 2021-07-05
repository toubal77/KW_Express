import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kw_express/helper/api_app.dart';
import 'package:kw_express/models/restaurant.dart';

class DatabaseMethodes {
  Future<List<Restaurant?>?> getRestaurant() async {
    try {
      List<Restaurant?> list = [];
      var url = Uri.parse(ApiApp.restaurant);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        var rest = data["data"] as List;

        list =
            rest.map<Restaurant>((json) => Restaurant.fromJson(json)).toList();
        return list;
      } else {
        print('Response status: ${response.statusCode}');
      }
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    } catch (e) {
      print(e.toString());
    }
  }
}
