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
    } catch (e) {
      print(e.toString());
    }
  }

  Future fetechdetailResto() async {
    try {
      var url = Uri.parse(ApiApp.restaurantDetail);
      var url2 = Uri.parse(ApiApp.menu);
      var response = await http.post(
        url,
        body: {
          'Resto': '3',
        },
      );
      var response2 = await http.post(
        url2,
        body: {
          'Resto': '3',
        },
      );
      if (response.statusCode == 200) {
        print('seccus');
        print(json.decode(response.body));
        print('seccus2');
        print(json.decode(response2.body));
        print('ofdijhrt');
        print(json.decode(response.body)['data']);
        print('ofdijhrt');
        print(json.decode(response2.body)['data']);
        print('ohgrhhehejrtjr');
      } else {
        print('false');
        print('Response status: ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
