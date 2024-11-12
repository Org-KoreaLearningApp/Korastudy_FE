import 'package:flutter/material.dart';
import 'package:korastudy_fe/components/search_component.dart';
import 'package:korastudy_fe/navigation/navbar.dart';
import 'package:korastudy_fe/pages/forums/forums_screen.dart';
import 'package:korastudy_fe/pages/home/main_content/card_friend.dart';
import 'package:korastudy_fe/pages/home/main_content/fulltest_content.dart';
import 'package:korastudy_fe/pages/home/main_content/new_update_content.dart';
import 'package:korastudy_fe/pages/home/main_content/practice_content.dart';
import 'package:korastudy_fe/pages/home/notification/notification_screen.dart';
import 'package:korastudy_fe/pages/profile/profile_screen.dart';
import 'package:korastudy_fe/pages/testpage/ListTest.dart';
import 'package:korastudy_fe/pages/welcome/topik_chose_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeContent(),
    ListTestWidget(),
    ForumScreen(),
    ProfileScreen(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomeContent();

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
      currentScreen = _pages[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => TopikChosePageWidget(),
          ),
        );
        return false; // Ngăn không cho thoát ứng dụng khi nhấn back
      },
      child: Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset: false,
            body: PageStorage(
              child: currentScreen,
              bucket: bucket,
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: NavBar(
              currentIndex: _currentIndex,
              onTabSelected: _onTabSelected,
            ),
          ),
          Positioned(
            bottom: 20,
            left: MediaQuery.of(context).size.width / 2 - 28,
            child: FloatingActionButton(
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.add_box,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            // AppBar-like Section with SearchComponent
            Container(
              height: 220,
              decoration: BoxDecoration(
                color: Color.fromRGBO(30, 165, 252, 1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(33),
                  bottomRight: Radius.circular(33),
                ),
              ),
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 45, // Đẩy xuống bằng cách tăng padding trên
                bottom: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TopikChosePageWidget(),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                      Text(
                        'TOPIK I',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontSize: 30,
                          letterSpacing: -0.3,
                          fontWeight: FontWeight.bold,
                          height: 1,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Thêm sự kiện onPressed để chuyển hướng đến trang Notification
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NotificationWidget(),
                            ),
                          );
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.lightBlue[400],
                          radius: 22,
                          child: Icon(
                            Icons.notifications_none,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  SearchComponent(),
                ],
              ),
            ),

            // Nội dung luyện tập
            SizedBox(height: 20),
            PracticeContent(),
            NewUpdate(),
            SizedBox(height: 40),
            CardFriend(),
            SizedBox(height: 40),
            FulltestContent(),
          ],
        ),
      ),
    );
  }
}
