import 'package:flutter/material.dart';
import 'package:nimfo/screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nimfo - Anime Info',
      theme: ThemeData(),
      home: MainScreen(),
    );
  }
}
