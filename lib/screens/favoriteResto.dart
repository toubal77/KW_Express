import 'package:flutter/material.dart';

class FavoriteResto extends StatefulWidget {
  @override
  _FavoriteRestoState createState() => _FavoriteRestoState();
}

class _FavoriteRestoState extends State<FavoriteResto> {
  @override
  Widget build(BuildContext context) {
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
    );
  }
}
