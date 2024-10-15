import 'package:flutter/material.dart';
import 'package:korastudy_fe/screens/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "KoraStudy App",
      home: Homescreen(),
    );
  }
}
