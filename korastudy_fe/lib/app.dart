import 'package:flutter/material.dart';
import 'package:korastudy_fe/screens/welcome/welcome_page_2.dart';
import 'package:korastudy_fe/screens/welcome/welcome_page_4.dart';
import 'screens/welcome/splash.dart';
import 'package:korastudy_fe/screens/welcome/welcome_page_1.dart';
import 'package:korastudy_fe/screens/welcome/welcome_page_3.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/welcome1': (context) => WelcomePage1(),
        '/welcome2': (context) => WelcomePage2(),
        '/welcome3': (context) => WelcomePage3(),
        '/welcome4': (context) => WelcomePage4(),
      },
    );
  }
}
