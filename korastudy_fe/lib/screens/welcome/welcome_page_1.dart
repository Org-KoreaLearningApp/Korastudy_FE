import 'package:flutter/material.dart';

class WelcomePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: screenHeight * 0.28,
                left: screenWidth * -0.13,
                child: Container(
                  width: screenWidth * 1.13,
                  height: screenHeight * 0.44,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Koreanlearn.png'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: screenHeight * 0.02,
                left: screenWidth * 0.75,
                child: Container(
                  width: screenWidth * 0.6,
                  height: screenHeight * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.elliptical(234, 209)),
                  ),
                ),
              ),
              Positioned(
                top: screenHeight * 0.14,
                left: screenWidth * 0.12,
                child: Text(
                  'Bắt đầu hành trình chinh phục \nChứng chỉ topik nào ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Inter',
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                ),
              ),
              Positioned(
                top: screenHeight * 0.72,
                left: screenWidth * 0.05,
                child: Text(
                  'GIờ thì hãy cùng tìm hiểu cách KoraStudy\n giúp bạn luyện thi topik nhé   ',
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
                top: screenHeight * 0.89,
                left: screenWidth * 0.67,
                child: Container(
                  width: screenWidth * 0.6,
                  height: screenHeight * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.elliptical(234, 209)),
                  ),
                ),
              ),
              Positioned(
                top: screenHeight * 0.83,
                left: screenWidth * -0.17,
                child: Container(
                  width: screenWidth * 0.6,
                  height: screenHeight * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.elliptical(234, 209)),
                  ),
                ),
              ),
              Positioned(
                top: screenHeight * 0.87,
                left: screenWidth * 0.21,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(30, 165, 252, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.13, vertical: screenHeight * 0.02),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/welcome2');
                  },
                  child: Text(
                    'Bắt đầu học nào ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Inter',
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.normal,
                      height: 1,
                    ),
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