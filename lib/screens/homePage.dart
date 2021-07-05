import 'package:flutter/material.dart';
import 'package:kw_express/models/restaurant.dart';
import 'package:kw_express/services/databases.dart';
import 'package:kw_express/widgets/cardBuildRestaurant.dart';
import 'package:kw_express/widgets/carouselHome.dart';
import 'package:kw_express/widgets/textFieldSearch.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          CarouselHome(),
          TextFieldSearch(),
          FutureBuilder<List<Restaurant?>?>(
            future: DatabaseMethodes().getRestaurant(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return CardBuildRestaurant(snapshot.data![index]);
                    },
                  ),
                );
              }
              return CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }
}
