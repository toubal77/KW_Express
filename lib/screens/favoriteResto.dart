import 'package:flutter/material.dart';

class FavoriteResto extends StatelessWidget {
  const FavoriteResto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
    );
  }
}
