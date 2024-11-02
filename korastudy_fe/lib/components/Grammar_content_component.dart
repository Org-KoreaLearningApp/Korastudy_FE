import 'package:flutter/material.dart';

class GrammarContent extends StatelessWidget {
  final String title;
  final String subtitle;
  final String content; // Thêm trường cho nội dung

  const GrammarContent({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.content, // Thêm tham số cho nội dung
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Phần header với nền xanh
        Container(
          padding: const EdgeInsets.all(8.0), // Thêm padding trên và dưới
          decoration: BoxDecoration(
            color: Colors.blue, // Màu nền xanh
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(20.0)), // Bo tròn góc trên
          ),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, // Sắp xếp các widget
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white), // Màu chữ trắng
                ),
              ),
              TextButton(
                onPressed: () {
                  // Xử lý sự kiện khi nhấn nút Out
                  Navigator.pop(context); // Đóng modal
                },
                child: Text(
                  'Out',
                  style: TextStyle(color: Colors.white), // Màu chữ trắng
                ),
              ),
            ],
          ),
        ),
        Container(
          // Không có padding ngang
          padding: const EdgeInsets.only(
              top: 16.0, bottom: 16.0), // Chỉ padding trên và dưới
          decoration: BoxDecoration(
            color: Colors.white, // Màu nền trắng cho phần nội dung
            // Không bo tròn góc dưới
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subtitle,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Divider(color: Colors.black),
              SizedBox(height: 10),
              Text(
                content, // Hiển thị nội dung
                style: TextStyle(fontSize: 16),
              ),
              // Thêm các trường khác tại đây nếu cần
            ],
          ),
        ),
      ],
    );
  }
}
