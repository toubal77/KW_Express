import 'package:flutter/material.dart';
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
          CardBuildRestaurant(),
        ],
      ),
    );
  }
}
