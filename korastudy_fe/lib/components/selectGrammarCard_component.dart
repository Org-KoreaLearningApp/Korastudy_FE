import 'package:flutter/material.dart';

class SelectGrammar extends StatelessWidget {
  final String title;
  final String imagePath;

  // Cung cấp giá trị mặc định cho imagePath
  const SelectGrammar({
    Key? key,
    required this.title,
    this.imagePath =
        'assets/images/grammarlogo.jpg', // Đường dẫn hình ảnh mặc định
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 115,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // Khung chứa hình ảnh
          Container(
            width: 80,
            height: 81,
            decoration: BoxDecoration(
              color: Colors.white, // Màu nền của khung
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10), // Bo tròn các góc
              child: Image(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          // Tiêu đề không có khung
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Inter',
              fontSize: 16,
              fontWeight: FontWeight.normal,
              height: 1.5,
              decoration: TextDecoration.none, // Loại bỏ đường gạch dưới
            ),
          ),
        ],
      ),
    );
  }
}
