import 'package:flutter/material.dart';

class PostTypeButton extends StatefulWidget {
  final String typeName;

  PostTypeButton({required this.typeName});

  @override
  State<PostTypeButton> createState() => _PostTypeButtonState();
}

class _PostTypeButtonState extends State<PostTypeButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        widget.typeName,
        style: TextStyle(color: Color(0xFF1EA5FC)),
      ),
      style: TextButton.styleFrom(
        side: BorderSide(color: Color(0xFF1EA5FC)),
      ),
    );
  }
}
