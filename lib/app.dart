import 'package:flutter/material.dart';
import 'screens/TestScreen/ListTest.dart';
import 'screens/TestScreen/TestPageListening.dart'; // Ensure this import is correct

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test Page Screen App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => ListTestWidget(), // Set ListTestWidget as the initial route
        '/testPageListening': (context) => TestPageListening(), // Add TestPageListening route
      },
    );
  }
}