import 'package:flutter/material.dart';
import 'dart:math' as math;

class DictionaryVerbWidget extends StatelessWidget {
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
            top: 46,
            left: 0,
            child: Container(
              width: 400,
              height: 85,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    offset: Offset(0, 4),
                    blurRadius: 4,
                  )
                ],
                color: Color.fromRGBO(30, 165, 252, 1),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 30,
                    left: 25,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 12,
                    left: 90,
                    child: Container(
                      width: 290,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 20,
                            left: 10,
                            child: Icon(
                              Icons.search,
                              color: Color.fromRGBO(141, 141, 141, 1),
                              size: 30,
                            ),
                          ),
                          Positioned(
                            top: 22,
                            left: 46,
                            child: Text(
                              'Tra cứu cách chia động từ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromRGBO(141, 141, 141, 1),
                                fontFamily: 'Inter',
                                fontSize: 16,
                                letterSpacing: -0.3,
                                fontWeight: FontWeight.normal,
                                height: 1,
                              ),
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
          Positioned(
            top: 146,
            left: 0,
            child: Container(
              width: 390,
              height: 33,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 0,
                    left: 25,
                    child: Container(
                      width: 140,
                      height: 31,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(254, 182, 156, 1),
                      ),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                              top: 5,
                              left: 10,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.whatshot,
                                    color: Color.fromRGBO(223, 17, 37, 1),
                                    size: 20,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'Từ khóa hot',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color.fromRGBO(223, 17, 37, 1),
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      letterSpacing: -0.3,
                                      fontWeight: FontWeight.normal,
                                      height: 1,
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 194,
            left: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 2),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(6, (index) {
                  return Column(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 13),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              '메붙이다',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromRGBO(24, 113, 172, 1),
                                fontFamily: 'Inter',
                                fontSize: 20,
                                letterSpacing: -0.3,
                                fontWeight: FontWeight.normal,
                                height: 1,
                              ),
                            ),
                            SizedBox(height: 0),
                            Text(
                              'ràng buộc',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromRGBO(141, 141, 141, 1),
                                fontFamily: 'Inter',
                                fontSize: 16,
                                letterSpacing: -0.3,
                                fontWeight: FontWeight.normal,
                                height: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Transform.rotate(
                        angle: 0.17468171859449774 * (math.pi / 180),
                        child: Divider(
                          color: Color.fromRGBO(224, 224, 224, 1),
                          thickness: 1,
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
