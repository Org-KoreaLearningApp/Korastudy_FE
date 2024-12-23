import 'package:flutter/material.dart';

class LoginInput extends StatelessWidget {
  final String label;
  final IconData icon;
  final TextEditingController controller;

  LoginInput(
      {required this.label, required this.icon, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderSide: BorderSide(
              // color: Colors.blue,
              // width: 4.0,
              ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.blue, // Color for the focused border
            width: 2.0, // Thickness when focused
          ),
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.6),
      ),
      controller: controller,
    );
  }
}
