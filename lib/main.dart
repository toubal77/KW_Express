import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kw_express/auth/authScreen.dart';
import 'package:kw_express/models/cart.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return Cart();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'K&W Express',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AuthScreen(),
      ),
    );
  }
}
