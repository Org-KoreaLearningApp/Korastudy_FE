import 'package:flutter/material.dart';

class Vocabulary_list_meanWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth,
      height: screenHeight,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: -screenHeight * 0.1,
            left: -screenWidth * 0.25,
            child: Container(
              width: screenWidth * 0.6,
              height: screenHeight * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(screenWidth * 0.6, screenHeight * 0.25)),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.05,
            left: 0,
            child: Container(
              width: screenWidth,
              height: screenHeight * 0.07,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    offset: Offset(0, 4),
                    blurRadius: 4,
                  ),
                ],
                color: Color.fromRGBO(94, 186, 217, 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Text(
                    'Từ Vựng',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Inter',
                      fontSize: screenWidth * 0.05,
                      letterSpacing: -0.3,
                      fontWeight: FontWeight.bold,
                      height: 1,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.12), // Placeholder to balance the row
                ],
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.14,
            left: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02, vertical: screenHeight * 0.004),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  buildButton('Định nghĩa', screenWidth * 0.04),
                  SizedBox(width: screenWidth * 0.05),
                  buildButton('Chọn từ ', screenWidth * 0.06),
                  SizedBox(width: screenWidth * 0.05),
                  buildButton('Game', screenWidth * 0.08),
                ],
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.2,
            left: 0,
            child: Container(
              width: screenWidth,
              height: screenHeight * 0.68,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02, vertical: screenHeight * 0.02),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Center(child: buildVocabularyCard('오이', 'Quả dưa chuột', screenWidth, screenHeight)),
                      SizedBox(height: screenHeight * 0.01),
                      Center(child: buildVocabularyCard('사과', 'Quả táo', screenWidth, screenHeight)),
                      SizedBox(height: screenHeight * 0.01),
                      Center(child: buildVocabularyCard('바나나', 'Quả chuối', screenWidth, screenHeight)),
                      SizedBox(height: screenHeight * 0.01),
                      Center(child: buildVocabularyCard('포도', 'Quả nho', screenWidth, screenHeight)),
                      // Add more vocabulary cards as needed
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.87,
            left: screenWidth * 0.05,
            child: Container(
              width: screenWidth * 0.9,
              height: screenHeight * 0.1,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: screenHeight * 0.02,
                    left: screenWidth * 0.25,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color.fromRGBO(30, 165, 252, 1),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.12, vertical: screenHeight * 0.02),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'Kiểm tra ',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Inter',
                              fontSize: screenWidth * 0.04,
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold,
                              height: 1,
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
        ],
      ),
    );
  }

  Widget buildButton(String text, double leftPadding) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black, backgroundColor: Colors.white,
        shadowColor: Colors.black.withOpacity(0.25),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(horizontal: leftPadding, vertical: 11),
      ),
      onPressed: () {
        // Define button action here
      },
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color.fromRGBO(0, 0, 0, 1),
          fontFamily: 'Inter',
          fontSize: 16,
          letterSpacing: -0.3,
          fontWeight: FontWeight.bold,
          height: 1,
        ),
      ),
    );
  }

  Widget buildVocabularyCard(String word, String meaning, double screenWidth, double screenHeight) {
    return Container(
      width: screenWidth * 0.95,
      height: screenHeight * 0.16,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            offset: Offset(4, 4),
            blurRadius: 4,
          ),
        ],
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: screenWidth * 0.17,
              height: screenHeight * 0.16,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: screenHeight * 0.05,
                    left: screenWidth * 0.02,
                    child: Container(
                      width: screenWidth * 0.13,
                      height: screenWidth * 0.13,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(94, 186, 217, 1),
                        borderRadius: BorderRadius.all(Radius.elliptical(screenWidth * 0.13, screenWidth * 0.13)),
                      ),
                      child: Icon(Icons.volume_up, color: Colors.white), // Speaker icon
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: screenWidth * 0.78,
            child: Container(
              width: screenWidth * 0.17,
              height: screenHeight * 0.16,
              child: Icon(Icons.favorite_border, color: Colors.black, size: screenWidth * 0.08), // Team icon
            ),
          ),
          Positioned(
            top: 0,
            left: screenWidth * 0.17,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: screenHeight * 0.04),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02, vertical: 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          word,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontFamily: 'Inter',
                            fontSize: screenWidth * 0.05,
                            letterSpacing: -0.3,
                            fontWeight: FontWeight.bold,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02, vertical: screenHeight * 0.005),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          meaning,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontFamily: 'Inter',
                            fontSize: screenWidth * 0.04,
                            letterSpacing: -0.3,
                            fontWeight: FontWeight.bold,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Container(
                    width: screenWidth * 0.6,
                    height: screenHeight * 0.03,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: screenHeight * 0.005,
                          left: screenWidth * 0.01,
                          child: Text(
                            'Thêm ghi chú',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontFamily: 'Inter',
                              fontSize: screenWidth * 0.04,
                              letterSpacing: -0.3,
                              fontWeight: FontWeight.bold,
                              height: 1,
                              decoration: TextDecoration.underline,
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
        ],
      ),
    );
  }
}