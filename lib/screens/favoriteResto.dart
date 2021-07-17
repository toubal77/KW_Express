import 'package:flutter/material.dart';

class FavoriteResto extends StatelessWidget {
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
