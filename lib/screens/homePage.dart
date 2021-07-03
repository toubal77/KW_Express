import 'package:flutter/material.dart';
import 'package:kw_express/widgets/carouselHome.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          CarouselHome(),
        ],
      ),
    );
  }
}
