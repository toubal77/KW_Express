import 'package:flutter/material.dart';

import 'package:kw_express/widgets/cardBuildRestaurant.dart';
import 'package:provider/provider.dart';

class FavoriteResto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoriteResto = Provider.of<FavoriteResto>(context);
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
      body: Expanded(
        child: favoriteResto.items!.length == 0
            ? Center(
                child: Text('You don\'t have item - let add some!'),
              )
            : ListView.builder(
                itemCount: favoriteResto.items!.length,
                itemBuilder: (context, index) {
                  return CardBuildRestaurant(
                    res: favoriteResto.items![index],
                    isLoading: false,
                  );
                },
              ),
      ),
    );
  }
}
