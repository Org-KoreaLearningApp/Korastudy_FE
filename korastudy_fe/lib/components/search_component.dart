import 'package:flutter/material.dart';

class SearchComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
        border: Border.all(color: Color.fromRGBO(164, 164, 164, 1), width: 1),
      ),
      child: Row(
        children: [
          Text(
            'Tìm kiếm...',
            style: TextStyle(
              color: Color.fromRGBO(164, 164, 164, 1),
              fontSize: 12,
              height: 1,
            ),
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color.fromRGBO(30, 165, 252, 1),
            ),
            padding: EdgeInsets.all(5),
            child: Icon(Icons.search, color: Colors.white, size: 24),
          ),
        ],
      ),
    );
  }
}
