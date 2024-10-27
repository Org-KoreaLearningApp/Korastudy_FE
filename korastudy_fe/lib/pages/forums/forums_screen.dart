import 'package:flutter/material.dart';

class ForumsScreen extends StatefulWidget {
  const ForumsScreen({super.key});

  @override
  State<ForumsScreen> createState() => _ForumsScreenState();
}

class _ForumsScreenState extends State<ForumsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Forum')),
      body: Center(
        child: Text(
          'Forum Screen',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
