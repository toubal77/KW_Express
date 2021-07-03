import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kw_express/helper/api_app.dart';
import 'package:kw_express/models/restaurant.dart';

class DatabaseMethodes {
  Future<Restaurant?> getRestaurant() async {
    try {
      var url = Uri.parse(ApiApp.restaurant);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return Restaurant.fromJson(jsonDecode(response.body));
      } else {
        print('Response status: ${response.statusCode}');
      }
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      return null;
    } catch (e) {
      print(e.toString());
    }
  }
}
