import 'package:flutter/material.dart';
import 'package:korean_flutter/screens/personal_post_screen.dart';
import 'package:korean_flutter/screens/profile_screen.dart';

class PersonalScreen extends StatelessWidget {
  const PersonalScreen({super.key});

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
            'Cá nhân',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFF1EA5FC),
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Tài khoản",
              ),
              Tab(
                text: "Bài đăng",
              ),
            ],
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
          ),
        ),
        body: TabBarView(
          children: [
            ProfileScreen(),
            PersonalPostScreen(),
          ],
        ),
      ),
    );
  }
}
