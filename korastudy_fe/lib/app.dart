import 'package:flutter/material.dart';
import 'screens/welcome/splash.dart';
import 'screens/welcome/welcome_page_1.dart';

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
        '/welcome': (context) => WelcomePage1(),
      },
    );
  }
}