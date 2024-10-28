import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PracticeContent extends StatefulWidget {
  @override
  _PracticeContentState createState() => _PracticeContentState();
}

class _PracticeContentState extends State<PracticeContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 15, vertical: 5), // Điều chỉnh padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Căn lề trái cho tiêu đề
        children: <Widget>[
          Text(
            'Luyện tập',
            style: TextStyle(
              color: Color.fromRGBO(17, 12, 38, 1),
              fontFamily: 'Inter',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              height: 1,
            ),
          ),
          SizedBox(height: 12),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildComponent(
                    'Đọc hiểu', 'assets/svg/Book_check_duotone_line.svg'),
                _buildComponent(
                    'Nghe hiểu', 'assets/svg/Headphones_fill_duotone_line.svg'),
                _buildComponent('Từ Vựng', 'assets/svg/File_duotone.svg'),
                _buildComponent(
                    'Ngữ pháp', 'assets/svg/Book_open_duotone_line.svg'),
              ],
            ),
          ),
          SizedBox(height: 20), // Khoảng cách dưới cùng
        ],
      ),
    );
  }

  // Hàm dùng chung để xây dựng các thành phần trong Row
  Widget _buildComponent(String title, String iconPath) {
    return GestureDetector(
      onTap: () {
        if (title == 'Ngữ pháp') {
          Navigator.pushNamed(context, '/Grammar');
        } else if (title == 'Từ Vựng') {
          Navigator.pushNamed(context, '/vocabulary');
        }
      },
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                  offset: Offset(4, 4),
                  blurRadius: 4,
                ),
              ],
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(
                color: Color.fromRGBO(30, 165, 252, 1),
                width: 1.5,
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              children: <Widget>[
                SvgPicture.asset(
                  iconPath,
                  width: 30,
                  height: 30,
                ),
                SizedBox(height: 5),
                Container(
                  width: 40,
                  height: 6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(30, 165, 252, 1),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              color: Color.fromRGBO(17, 12, 38, 1),
              fontFamily: 'Inter',
              fontSize: 15,
              fontWeight: FontWeight.normal,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
