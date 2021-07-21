import 'package:flutter/material.dart';
import 'package:kw_express/models/restaurant.dart';
import 'package:kw_express/widgets/cardBuildRestaurant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteResto extends StatefulWidget {
  @override
  _FavoriteRestoState createState() => _FavoriteRestoState();
}

class _FavoriteRestoState extends State<FavoriteResto> {
  List<Restaurant?>? _list = [];
  Future getFavorite() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    //get string favorites

    final String? favorites = prefs.getString('favorite');
    final List<Restaurant?>? favo = Restaurant.decode(favorites);

    _list = favo;

    print(' first resto ' + favo.toString());
  }

  @override
  void initState() {
    getFavorite();
    super.initState();
  }

  Widget build(BuildContext context) {
    // final resto = Provider.of<FavoriteResto>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Mes Restaurants Favoris',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        elevation: 10.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _list!.length,
              itemBuilder: (context, index) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: _list!.length,
                    itemBuilder: (context, index) {
                      return CardBuildRestaurant(
                        res: _list![index],
                        isLoading: false,
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
