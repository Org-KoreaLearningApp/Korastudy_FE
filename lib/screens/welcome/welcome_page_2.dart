import 'package:flutter/material.dart';

class WelcomePage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          final screenHeight = constraints.maxHeight;

          return Container(
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
                    width: screenWidth * 1.3,
                    height: screenHeight * 0.36,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/assets/images/oreanlearn2.png'),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: screenHeight * -0.02,
                  left: screenWidth * 0.76,
                  child: Container(
                    width: screenWidth * 0.6,
                    height: screenHeight * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.elliptical(234, 209)),
                    ),
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.81,
                  left: screenWidth * 0.15,
                  child: Container(
                    width: screenWidth * 0.7,
                    height: screenHeight * 0.06,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color.fromRGBO(30, 165, 252, 1),
                    ),
                    child: Center(
                      child: Text(
                        'Đăng Nhập / Đăng Ký ',
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
                ),
                Positioned(
                  top: screenHeight * 0.14,
                  left: screenWidth * 0.21,
                  child: Text(
                    'Đăng Nhập để luyện thi\nhiệu quả hơn nhá ',
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
                  top: screenHeight * 0.68,
                  left: screenWidth * 0.07,
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
                  left: screenWidth * 0.41,
                  child: Text(
                    'Bỏ qua ',
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
                  top: screenHeight * 0.84,
                  left: screenWidth * -0.28,
                  child: Container(
                    width: screenWidth * 0.6,
                    height: screenHeight * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.elliptical(234, 209)),
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
                            borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.013),
                        Container(
                          width: screenWidth * 0.025,
                          height: screenHeight * 0.012,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(167, 171, 153, 1),
                            borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}