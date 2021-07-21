import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:kw_express/helper/api_app.dart';
import 'package:kw_express/models/restaurant.dart';

import 'package:kw_express/widgets/cardBuildRestaurant.dart';
import 'package:kw_express/widgets/carouselHome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _searchController = TextEditingController();
  List<Restaurant?> _list = [];
  List<Restaurant?> _search = [];
  var isLoading = false;
  Future<List<Restaurant?>?> getRestaurant() async {
    setState(() {
      isLoading = true;
    });
    _list.clear();
    try {
      var url = Uri.parse(ApiApp.restaurant);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        print('seccus get restaurant');
        final data = json.decode(response.body)["data"];
        setState(() {
          for (Map<String, dynamic> i in data) {
            _list.add(Restaurant.fromJson(i));
          }
        });
      } else {
        print('field get restaurant');
        print('Response status: ${response.statusCode}');
      }
    } catch (e) {
      print('field to try get restaurant');
      print(e.toString());
    }
    setState(() {
      isLoading = false;
    });
  }

  onSearch(String title) async {
    _search.clear();
    if (title.isEmpty) {
      setState(() {});
      return;
    }
    _list.forEach((f) {
      if (f!.nom_resto.contains(title)) _search.add(f);
    });
    setState(() {});
  }

  Future getCurrentLocalisation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    print(lastPosition);
    var lat = position.latitude;
    var log = position.longitude;
    print('lalitude: $lat, logitude: $log');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var location =
        'Livraison: https://www.google.com/maps/search/api=1&query=$lat,$log' +
            '\n\n';
    prefs.setString('location', location);
  }

  @override
  void initState() {
    getRestaurant().then((value) => setState(() {
          isLoading = false;
        }));
    getCurrentLocalisation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          CarouselHome(),
          // TextFieldSearch(),
          Container(
            height: 50,
            padding: EdgeInsets.only(top: 7, left: 16, right: 16, bottom: 5),
            child: TextField(
              textAlign: TextAlign.center,
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search...",
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade600,
                  size: 20,
                ),
                filled: true,
                fillColor: Colors.grey.shade300,
                contentPadding: EdgeInsets.all(8),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              ),
              onChanged: onSearch,
            ),
          ),
          Expanded(
            child: isLoading
                ? CardBuildRestaurant(
                    res: null,
                    isLoading: true,
                  )
                : _search.length != 0 || _searchController.text.isNotEmpty
                    ? ListView.builder(
                        itemCount: _search.length,
                        itemBuilder: (context, index) {
                          return CardBuildRestaurant(
                            res: _search[index],
                            isLoading: false,
                          );
                        },
                      )
                    : ListView.builder(
                        itemCount: _list.length,
                        itemBuilder: (context, index) {
                          return CardBuildRestaurant(
                            res: _list[index],
                            isLoading: false,
                          );
                        },
                      ),
          ),
          // FutureBuilder<List<Restaurant?>?>(
          //   future: DatabaseMethodes().getRestaurant(),
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       return Expanded(
          //         child: ListView.builder(
          //           itemCount: snapshot.data!.length,
          //           itemBuilder: (context, index) {
          //             return CardBuildRestaurant(
          //               res: snapshot.data![index],
          //               isLoading: false,
          //             );
          //           },
          //         ),
          //       );
          //     }
          //     return CardBuildRestaurant(
          //       res: null,
          //       isLoading: true,
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
