import 'package:flutter/material.dart';
import 'package:korastudy_fe/pages/grammar/grammar_main.dart';
import 'package:korastudy_fe/pages/home/home_screen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "KoraStudy App",
      home: HomeScreen(),
      routes: {
        '/grammar': (context) => const GrammarMain(),
        // Thêm các route khác ở đây nếu cần
      },
    );
  }
}
