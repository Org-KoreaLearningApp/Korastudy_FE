import 'package:flutter/material.dart';

class LoginInput extends StatelessWidget {
  final String label;
  final IconData icon;

  LoginInput({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: Icon(icon),
        border: OutlineInputBorder(),
      ),
    );
  }
}
