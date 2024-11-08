import 'package:flutter/material.dart';

class TotalGrammar extends StatelessWidget {
  final String title;
  final String counterText;
  final String imagePath;

  // Constructor để truyền các tham số động
  const TotalGrammar({
    Key? key,
    required this.title,
    required this.counterText,
    this.imagePath = 'assets/images/grammarlogo.jpg', // Đường dẫn ảnh mặc định
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 374,
      height: 118,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            offset: Offset(0, 4),
            blurRadius: 4,
          ),
        ],
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 16,
            left: 14,
            child: Container(
              width: 85,
              height: 86,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          Positioned(
            top: 35,
            left: 124,
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Inter',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                height: 1,
              ),
            ),
          ),
          Positioned(
            top: 74,
            left: 124,
            child: Row(
              children: [
                Icon(
                  Icons.check,
                  color: Colors.green,
                  size: 24,
                ),
                SizedBox(width: 4),
                Text(
                  counterText,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Inter',
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}