import 'package:flutter/material.dart';
import 'package:kw_express/helper/icons_app.dart';
import 'package:kw_express/screens/espaceClient.dart';
import 'package:kw_express/screens/favoriteResto.dart';
import 'package:kw_express/screens/homePage.dart';
import 'package:kw_express/screens/offreResto.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetsOptions = [
      HomePage(),
      FavoriteResto(),
      OffreResto(),
      EspaceClient(),
    ];
    void onTapBottomNavigation(index) {
      setState(() {
        selectIndex = index;
      });
    }

    return Scaffold(
      body: widgetsOptions.elementAt(selectIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        onTap: onTapBottomNavigation,
        currentIndex: selectIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(IconsApp.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconsApp.favorite,
            ),
            label: 'favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconsApp.effres,
            ),
            label: 'effres',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconsApp.espace_client,
            ),
            label: 'espace client',
          ),
        ],
      ),
    );
  }
}
