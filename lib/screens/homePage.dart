import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:kw_express/helper/api_app.dart';
import 'package:kw_express/models/restaurant.dart';

import 'package:kw_express/widgets/cardBuildRestaurant.dart';
import 'package:kw_express/widgets/carouselHome.dart';

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

  @override
  void initState() {
    getRestaurant().then((value) => setState(() {
          isLoading = false;
        }));

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
            child:
                // isLoading
                //     ? CardBuildRestaurant(
                //         res: null,
                //         isLoading: true,
                //       )
                //     :
                _search.length != 0 || _searchController.text.isNotEmpty
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
        ],
      ),
    );
  }
}
