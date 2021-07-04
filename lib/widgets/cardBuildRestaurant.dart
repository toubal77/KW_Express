import 'package:flutter/material.dart';
import 'package:kw_express/helper/icons_app.dart';

class CardBuildRestaurant extends StatefulWidget {
  @override
  _CardBuildRestaurantState createState() => _CardBuildRestaurantState();
}

class _CardBuildRestaurantState extends State<CardBuildRestaurant> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          height: 260,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 3,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/drawable_png/bg.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'toubal',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18.0,
                        ),
                      ),
                      Text(
                        'Akid Lotfi Oran',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        '11h-20h',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 100,
          left: 30,
          child: Container(
            width: 85,
            height: 85,
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              image: DecorationImage(
                image: AssetImage("assets/drawable_png/white-logo.png"),
                fit: BoxFit.cover,
              ),
              border: Border.all(color: Colors.white, width: 5.0),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
        Positioned(
          top: 120,
          right: 20,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 3,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Center(
              child: Text(
                '40-50min',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.0,
                ),
              ),
            ),
            height: 40,
            width: 100,
          ),
        ),
        Positioned(
          bottom: 35,
          right: 40,
          child: GestureDetector(
            onTap: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 3,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              height: 55,
              width: 55,
              child: Icon(
                isFavorite ? IconsApp.isFavorite : IconsApp.notFavorite,
                color: isFavorite ? Colors.red : Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
