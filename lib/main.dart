import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kw_express/auth/authScreen.dart';
import 'package:kw_express/home_widget.dart';
import 'package:kw_express/models/cart.dart';
import 'package:kw_express/models/favorite.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var numTel = prefs.getString('token');
  runApp(MyApp(numTel));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  var numTel;
  MyApp(this.numTel);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Cart()),
        ChangeNotifierProvider.value(value: FavoriteResto()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'K&W Express',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: numTel == null ? AuthScreen() : HomeWidget(),
      ),
    );
  }
}
