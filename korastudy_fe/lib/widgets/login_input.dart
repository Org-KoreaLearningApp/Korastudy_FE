import 'package:flutter/material.dart';

class LoginInput extends StatelessWidget {
  final String label;
  final IconData icon;
  dynamic controller;

  LoginInput({required this.label, required this.icon, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: Icon(icon),
        border: OutlineInputBorder(),
      ),
      controller: controller,
    );
  }
}