import 'package:flutter/material.dart';
import 'package:korastudy_fe/components/NotificationCard_component.dart';

class NotificationWidget extends StatefulWidget {
  @override
  _NotificationWidgetState createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  bool _hasNotification = true; // Biến để kiểm tra có thông báo hay không

  // Dữ liệu giả cho thông báo, thêm trạng thái đã đọc (isRead)
  final List<Map<String, dynamic>> notifications = [
    {
      'image': 'https://via.placeholder.com/150', // Hình ảnh giả
      'title': 'Thông Báo 1',
      'description': 'Bạn có một bài kiểm tra mới cần hoàn thành.',
      'isRead': false, // Trạng thái chưa đọc
    },
    {
      'image': 'https://via.placeholder.com/150', // Hình ảnh giả
      'title': 'Thông Báo 2',
      'description': 'Luyện tập ngày hôm nay đã có thêm câu hỏi mới.',
      'isRead': false, // Trạng thái chưa đọc
    },
    {
      'image': 'https://via.placeholder.com/150', // Hình ảnh giả
      'title': 'Thông Báo 3',
      'description': 'Đã có cập nhật mới trong phần học của bạn.',
      'isRead': false, // Trạng thái chưa đọc
    },
  ];

  // Hàm để thay đổi trạng thái tất cả thông báo thành đã đọc
  void _toggleNotification() {
    setState(() {
      // Kiểm tra xem có thông báo chưa đọc không, nếu có thì đánh dấu tất cả là đã đọc
      bool allRead =
          notifications.every((notification) => notification['isRead']);

      if (!allRead) {
        // Đánh dấu tất cả thông báo là đã đọc
        for (var notification in notifications) {
          notification['isRead'] = true;
        }
      } else {
        // Nếu tất cả đã đọc, có thể đổi lại trạng thái thành chưa đọc (nếu muốn)
        for (var notification in notifications) {
          notification['isRead'] = false;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Notification Page',
          style: TextStyle(
            color: Colors.white, // Màu trắng cho tiêu đề
            fontWeight: FontWeight.bold, // Đặt chữ in đậm cho tiêu đề
          ),
        ),
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(
          color: Colors.white, // Màu trắng cho các biểu tượng trong AppBar
        ),
        actions: [
          IconButton(
            icon: Icon(
              _hasNotification
                  ? Icons.notifications_active
                  : Icons.notifications,
            ),
            onPressed: _toggleNotification,
          ),
        ],
      ),
      body: _hasNotification
          ? ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return NotificationCard(
                  imageUrl: notifications[index]['image']!,
                  title: notifications[index]['title']!,
                  description: notifications[index]['description']!,
                  isRead: notifications[index]['isRead']!,
                );
              },
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.notifications_off, size: 100, color: Colors.white),
                  SizedBox(height: 20),
                  Text(
                    'No new notifications',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ),
    );
  }
}
