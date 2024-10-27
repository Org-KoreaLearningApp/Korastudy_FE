import 'package:flutter/material.dart';

class CardFriend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 300, // Chiều rộng tối đa của card
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color.fromRGBO(213, 253, 254, 1),
      ),
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 13),
      child: Row(
        children: <Widget>[
          // Khung cho title và button
          Expanded(
            child: _buildTitleAndButton(),
          ),
          SizedBox(width: 10), // Khoảng cách giữa nội dung và hình ảnh
          // Hình ảnh ở bên phải, giữ trong kích thước phù hợp
          SizedBox(
            width: 100, // Giới hạn chiều rộng của hình ảnh
            height: 100, // Giới hạn chiều cao của hình ảnh
            child: Image.asset(
              'assets/images/InviteFriend.png',
              fit: BoxFit.contain, // Đảm bảo hình ảnh nằm gọn trong khung
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleAndButton() {
    return Container(
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Canh trái cho các phần tử trong cột
        children: <Widget>[
          // Tiêu đề
          Text(
            'Invite your friends',
            style: TextStyle(
              color: Color.fromRGBO(17, 12, 38, 1),
              fontFamily: 'Abel',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6),
          // Mô tả
          Text(
            'Get \$20 for ticket',
            style: TextStyle(
              color: Color.fromRGBO(72, 77, 112, 1),
              fontFamily: 'Abel',
              fontSize: 13,
            ),
          ),
          SizedBox(height: 10),
          // Nút invite
          ElevatedButton(
            onPressed: () {
              // Xử lý hành động khi nhấn nút Invite
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(0, 248, 255, 1), // Màu nền nút
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: Text(
              'Invite',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Abel',
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
