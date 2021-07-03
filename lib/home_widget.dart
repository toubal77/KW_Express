import 'package:flutter/material.dart';
import 'package:kw_express/screens/homePage.dart';

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
      HomePage(),
      HomePage(),
      HomePage(),
    ];
    void onTapBottomNavigation(index) {
      setState(() {
        selectIndex = index;
      });
    }

    return Scaffold(
      body: widgetsOptions.elementAt(selectIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blueGrey,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        elevation: 0,
        onTap: onTapBottomNavigation,
        currentIndex: selectIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.takeout_dining_outlined,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_sharp,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_offer_outlined,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.support_agent_outlined,
            ),
          ),
        ],
      ),
    );
  }
}
