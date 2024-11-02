import 'package:flutter/material.dart';
import 'package:korastudy_fe/pages/account/login/login_screen.dart';
import 'package:korastudy_fe/pages/welcome/topik_chose_page.dart';
import 'package:korastudy_fe/pages/welcome/welcome_page_3.dart';

class WelcomePage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! < 0) {
            // Swiped left to go to the next page
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      WelcomePage3()), // Replace with your next page
            );
          } else if (details.primaryVelocity! > 0) {
            // Swiped right to go back to the previous page
            Navigator.pop(context);
          }
        },
        child: Container(
          width: screenWidth,
          height: screenHeight,
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: screenHeight * 0.32,
                left: screenWidth * -0.15,
                child: Container(
                  width: screenWidth * 1.4,
                  height: screenHeight * 0.32,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Koreanlearn2.png'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: screenHeight * -0.01,
                left: screenWidth * 0.76,
                child: Container(
                  width: screenWidth * 0.2,
                  height: screenHeight * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.elliptical(234, 209)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(
                            94, 186, 217, 0.5), // Shadow with some transparency
                        blurRadius: 100, // How much blur you want
                        spreadRadius: 30, // How much the shadow spreads
                        offset: Offset(0, 0), // Center the shadow
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: screenHeight * 0.81,
                left: screenWidth * 0.15,
                right: screenWidth * 0.15, // Adding right to center the button
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(30, 165, 252, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.13,
                        vertical: screenHeight * 0.02),
                  ),
                  onPressed: () {
                    // Chuyển hướng sang trang đăng nhập
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(), // Trang đăng nhập
                      ),
                    );
                  },
                  child: Text(
                    'Đăng Nhập / Đăng Ký',
                    textAlign: TextAlign
                        .center, // Centering the text inside the button
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Inter',
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.bold,
                      height: 1,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: screenHeight * 0.14,
                left: screenWidth * 0.1,
                right: screenWidth * 0.1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Đăng Nhập để luyện thi',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Inter',
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.bold, // Make the first line bold
                      ),
                    ),
                    Text(
                      'hiệu quả hơn nhá',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Inter',
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: screenHeight * 0.68,
                left: screenWidth * 0.1,
                right: screenWidth * 0.1,
                child: Text(
                  'Tham gia luyện thi với đề thi sát với đề \nthi thật topik thật  ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Inter',
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                ),
              ),
              Positioned(
                top: screenHeight * 0.93,
                left: screenWidth * 0.38,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  ),
                  onPressed: () {
                    // Add navigation logic for "Bỏ qua"
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              TopikChosePageWidget()), // Replace with your next page
                    );
                  },
                  child: Text(
                    'Bỏ qua',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Inter',
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold,
                      height: 1,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: screenHeight * 0.84,
                left: screenWidth * -0.28,
                child: Container(
                  width: screenWidth * 0.6,
                  height: screenHeight * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.elliptical(100, 100)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(
                            94, 186, 217, 0.5), // Shadow with some transparency
                        blurRadius: 100, // How much blur you want
                        spreadRadius: 30, // How much the shadow spreads
                        offset: Offset(0, 0), // Center the shadow
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: screenHeight * 0.77,
                left: screenWidth * 0.38,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        width: screenWidth * 0.15,
                        height: screenHeight * 0.012,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromRGBO(135, 185, 231, 1),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.013),
                      Container(
                        width: screenWidth * 0.025,
                        height: screenHeight * 0.012,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(167, 171, 153, 1),
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(10, 10)),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.013),
                      Container(
                        width: screenWidth * 0.025,
                        height: screenHeight * 0.012,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(167, 171, 153, 1),
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(10, 10)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Next Page'),
      ),
    );
  }
}
