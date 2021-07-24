import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kw_express/auth/authScreen.dart';

import 'package:kw_express/home_widget.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future getCurrentLocalisation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    print(lastPosition);
    var lat = position.latitude;
    var log = position.longitude;
    print('lalitude: $lat, logitude: $log');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var location =
        'Livraison: https://www.google.com/maps/search/api=1&query=$lat,$log' +
            '\n\n';
    prefs.setString('location', location);
    var numTel = prefs.getString('numTel');
    if (numTel == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AuthScreen(),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeWidget(),
        ),
      );
    }
  }

  @override
  void initState() {
    getCurrentLocalisation();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/drawable_png/splash_screen.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
