import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final bool isRead;

  const NotificationCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.isRead,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(15),
        leading: CircleAvatar(
          backgroundImage:
              NetworkImage(imageUrl), // Hình ảnh sẽ được lấy từ URL
          radius: 30,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color:
                isRead ? Colors.grey : Colors.black, // Thay đổi màu nếu đã đọc
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            description,
            style: TextStyle(
              color: isRead
                  ? Colors.grey[600]
                  : Colors.black, // Thay đổi màu nếu đã đọc
              fontSize: 14,
            ),
          ),
        ),
        trailing: isRead
            ? Icon(Icons.check_circle, color: Colors.green) // Biểu tượng đã đọc
            : null,
      ),
    );
  }
}
