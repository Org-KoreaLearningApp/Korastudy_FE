import 'package:flutter/material.dart';
import 'package:korean_flutter/screens/post_comment_screen.dart';
import 'package:korean_flutter/screens/post_detail_screen.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            'Kinh nghiệm ôn thi TOPIK II từ TOPIK I trong 6 tháng',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFF1EA5FC),
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Bài đăng",
              ),
              Tab(
                text: "Bình luận",
              ),
            ],
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
          ),
        ),
        body: TabBarView(
          children: [
            PostDetailScreen(),
            PostCommentScreen(),
          ],
        ),
      ),
    );
  }
}
