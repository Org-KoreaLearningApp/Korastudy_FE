import 'package:flutter/material.dart';
import 'package:korastudy_fe/screens/post_create_screen.dart';
import 'package:korastudy_fe/screens/post_list_screen.dart';
import 'package:korastudy_fe/screens/post_search_screen.dart';


class ForumScreen extends StatefulWidget {
  const ForumScreen({super.key});

  @override
  State<ForumScreen> createState() => _ForumScreenState();
}

class _ForumScreenState extends State<ForumScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            'Forum',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFF1EA5FC),
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Forum",
              ),
              Tab(
                text: "Tìm kiếm",
              ),
              Tab(
                text: "Tạo bài đăng",
              )
            ],
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
          ),
        ),
        body: TabBarView(
          children: [
            PostListScreen(),
            PostSearchScreen(),
            PostCreateScreen(),
          ],
        ),
      ),
    );
  }
}
