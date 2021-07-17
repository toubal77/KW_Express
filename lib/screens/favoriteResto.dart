import 'package:flutter/material.dart';
import 'package:kw_express/models/restaurant.dart';
import 'package:kw_express/widgets/cardBuildRestaurant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteResto extends StatefulWidget {
  @override
  _FavoriteRestoState createState() => _FavoriteRestoState();
}

class _FavoriteRestoState extends State<FavoriteResto> {
  List<Restaurant>? _list = [];
  saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // final data = widget.res;
    // String json = jsonEncode(data);
    // _list = prefs.getStringList('favoriteResto');
    // _list!.add(json);
    // prefs
    //     .setStringList('favoriteResto', _list!)
    //     .then((value) => print('resto added to favorite Resto.'));
    _list = prefs.getStringList('favoriteResto')!.cast<Restaurant>();
  }

  getRestaurant() async {}

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
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _list!.length,
              itemBuilder: (context, index) {
                return CardBuildRestaurant(
                  res: _list![index],
                  isLoading: false,
                );
              },
            ),
          ),
        ],
      ),
      // body: Expanded(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Expanded(
      //         child: resto.items.length == 0
      //             ? Center(
      //                 child: Text('You don\'t have item - let add some!'),
      //               )
      //             : ListView.builder(
      //                 itemCount: resto.items.length,
      //                 itemBuilder: (context, index) {
      //                   return Expanded(
      //                     child: ListView.builder(
      //                       itemCount: resto.items.length,
      //                       itemBuilder: (context, index) {
      //                         return CardBuildRestaurant(
      //                           res: resto.items[index],
      //                           isLoading: false,
      //                         );
      //                       },
      //                     ),
      //                   );
      //                 }),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
