import 'package:flutter/material.dart';
import 'package:korastudy_fe/pages/home/home_screen.dart';

class TopikChosePageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, // Ngăn không cho quay lại
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/images/topik_chose_page.png'), // Add your background image here
              fit: BoxFit.cover, // Adjust the image to fit the screen
            ),
          ),
          child: SafeArea(
            child: Stack(
              children: <Widget>[
                // Center Title
                Positioned(
                  top: 145, // Adjust the position as needed
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      width: 160,
                      height: 160,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(224, 105, 78, 1),
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(160, 160)),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 200,
                  left: 0,
                  right: 0,
                  child: Center(
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
                            fontWeight: FontWeight.bold,
                            height: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // Center TOPIK I and TOPIK II buttons
                Positioned(
                  top: 350,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Color.fromRGBO(0, 0, 0, 1),
                          backgroundColor: Color.fromRGBO(255, 249, 249, 1),
                          shadowColor: Color.fromRGBO(0, 0, 0, 0.25),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          minimumSize: Size(240, 50),
                        ),
                        onPressed: () {
                          // Add your onPressed code here!
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    HomeScreen()), // Replace with your next page
                          );
                        },
                        child: Text(
                          'TOPIK I',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 20,
                            letterSpacing: -0.3,
                            fontWeight: FontWeight.bold,
                            height: 1,
                          ),
                        ),
                      ),
                      SizedBox(height: 38),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Color.fromRGBO(0, 0, 0, 1),
                          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                          shadowColor: Color.fromRGBO(0, 0, 0, 0.25),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          minimumSize: Size(240, 50),
                        ),
                        onPressed: () {
                          // Add your onPressed code here!
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    HomeScreen()), // Replace with your next page
                          );
                        },
                        child: Text(
                          'TOPIK II',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 20,
                            letterSpacing: -0.3,
                            fontWeight: FontWeight.bold,
                            height: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
