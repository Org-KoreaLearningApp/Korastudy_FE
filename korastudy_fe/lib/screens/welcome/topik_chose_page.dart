import 'package:flutter/material.dart';

class TopikChosePageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 844,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Container(),
          ),
          Positioned(
            top: 518,
            left: -72,
            child: Container(
              width: 580,
              height: 387,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Image2.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          Positioned(
            top: -86,
            left: -107,
            child: Container(
              width: 234,
              height: 209,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(234, 209)),
              ),
            ),
          ),
          Positioned(
            top: 143,
            left: 115,
            child: Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                color: Color.fromRGBO(224, 105, 78, 1),
                borderRadius: BorderRadius.all(Radius.elliptical(160, 160)),
              ),
            ),
          ),
          Positioned(
            top: 198,
            left: 60,
            child: Container(
              width: 270,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromRGBO(216, 201, 175, 1),
              ),
              child: Center(
                child: Text(
                  'Chọn Cấp độ để bắt đầu',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Inter',
                    fontSize: 20,
                    letterSpacing: -0.3,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 248,
            left: 284,
            child: Container(
              width: 234,
              height: 209,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(234, 209)),
              ),
            ),
          ),
          Positioned(
            top: 402,
            left: -95,
            child: Container(
              width: 234,
              height: 209,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(234, 209)),
              ),
            ),
          ),
          Positioned(
            top: 383,
            left: 75,
            child: Container(
              width: 240,
              height: 149,
              child: Column(
                children: <Widget>[
                  Container(
                    width: 240,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(0, 4),
                          blurRadius: 4,
                        ),
                      ],
                      color: Color.fromRGBO(255, 249, 249, 1),
                    ),
                    child: Center(
                      child: Text(
                        'TOPIK I',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Inter',
                          fontSize: 20,
                          letterSpacing: -0.3,
                          fontWeight: FontWeight.normal,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 38),
                  Container(
                    width: 240,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(0, 4),
                          blurRadius: 4,
                        ),
                      ],
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    child: Center(
                      child: Text(
                        'TOPIK II',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Inter',
                          fontSize: 20,
                          letterSpacing: -0.3,
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
        ],
      ),
    );
  }
}