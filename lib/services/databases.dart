import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kw_express/helper/api_app.dart';
import 'package:kw_express/models/detailRestaurant.dart';
import 'package:kw_express/models/detailRestoMenu.dart';
import 'package:kw_express/models/offresResto.dart';
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

  Future<List<OffresResto?>?> getOffreResto() async {
    try {
      List<OffresResto?> list = [];
      var url = Uri.parse(ApiApp.restaurant);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        print('seccus get offre Resto');
        var data = json.decode(response.body);
        var rest = data["offre"] as List;

        list = rest
            .map<OffresResto>((json) => OffresResto.fromJson(json))
            .toList();
        return list;
      } else {
        print('field get offre Resto');
        print('Response status: ${response.statusCode}');
      }
    } catch (e) {
      print('field to try get offre Resto');
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

  Future updateVue(String idResto) async {
    try {
      var url = Uri.parse(ApiApp.updateVue);
      var response = await http.post(url, body: {
        'id_resto': idResto,
      });
      if (response.statusCode == 200) {
        print('seccus update vue resto');
      } else {
        print('field  update vue resto');
        print('Response status: ${response.statusCode}');
      }
    } catch (e) {
      print('field to try  update vue resto');
      print(e.toString());
    }
  }

  Future sendMessage(String nom, String num, String address) async {
    print(nom);
    print(num);
    print(address);
    // try {
    //   var url = Uri.parse(ApiApp.sendMessage);
    //   var response = await http.post(url, body: {
    //     'nom_feed': nom,
    //     'numero_client': num,
    //     'description': address,
    //   });

    //   if (response.statusCode == 200) {
    //     print('seccus send message');
    //   } else {
    //     print('field send message');
    //     print('Response status: ${response.statusCode}');
    //   }
    // } catch (e) {
    //   print('field to try send message');
    //   print(e.toString());
    // }
  }
}
