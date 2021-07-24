import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kw_express/models/cart.dart';
import 'package:kw_express/models/favorite.dart';
import 'package:kw_express/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
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
        home: SplashScreen(),
      ),
    );
  }
}
