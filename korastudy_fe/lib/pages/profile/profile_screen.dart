import 'package:flutter/material.dart';
import 'package:korastudy_fe/pages/profile/profile_info_screen.dart';
import 'package:korastudy_fe/pages/profile/profile_post_list_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                text: "Hồ sơ",
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
            ProfileInfoScreen(),
            ProfilePostListScreen(),
          ],
        ),
      ),
    );
  }
}
