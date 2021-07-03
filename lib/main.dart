import 'package:flutter/material.dart';
import 'package:kw_express/authScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'K&W Express',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthScreen(),
    );
  }
}
