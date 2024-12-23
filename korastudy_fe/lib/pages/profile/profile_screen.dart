import 'package:flutter/material.dart';
import 'package:korastudy_fe/pages/account/login/login_screen.dart';
import 'package:korastudy_fe/pages/account/signup/register_screen.dart';
import 'package:korastudy_fe/pages/profile/profile_info_screen.dart';
import 'package:korastudy_fe/pages/profile/profile_post_list_screen.dart';
import 'package:korastudy_fe/provider/user_provider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isLogin = false;
  String uid = "";

  @override
  void initState() {
    super.initState();
    uid = Provider.of<UserProvider>(context, listen: false).userId;
    isLogin = uid.isNotEmpty;
  }

  Widget _loginReminder() {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Cá nhân',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF1EA5FC),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
                "Vui lòng đăng nhập hoặc đăng ký để có thể xem thông tin của bạn."),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFF1EA5FC),
                      elevation: 5,
                      shadowColor: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text(
                      "Đăng nhập",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()),
                      );
                    },
                    label: Text(
                      "Đăng ký",
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFEEEEEE),
                      elevation: 5,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: isLogin
          ? DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  title: Text(
                    'Cá nhân',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  centerTitle: true,
                  backgroundColor: Color(0xFF1EA5FC),
                  bottom: TabBar(
                    tabs: [
                      Tab(text: "Hồ sơ"),
                      Tab(text: "Bài đăng"),
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
            )
          : _loginReminder(),
    );
  }
}
