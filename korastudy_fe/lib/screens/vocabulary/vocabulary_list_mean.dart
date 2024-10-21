import 'package:flutter/material.dart';

class Vocabulary_list_meanWidget extends StatelessWidget {
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
            top: 44,
            left: 0,
            child: Container(
              width: 400,
              height: 57,
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
                      fontSize: 20,
                      letterSpacing: -0.3,
                      fontWeight: FontWeight.bold,
                      height: 1,
                    ),
                  ),
                  SizedBox(width: 48), // Placeholder to balance the row
                ],
              ),
            ),
          ),
          Positioned(
            top: 119,
            left: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  buildButton('Định nghĩa', 17),
                  SizedBox(width: 20),
                  buildButton('Chọn từ ', 24.5),
                  SizedBox(width: 20),
                  buildButton('Game', 33),
                ],
              ),
            ),
          ),
          Positioned(
            top: 165,
            left: 0,
            child: Container(
              width: 390,
              height: 580, // Adjust height to fit within the screen
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 9, vertical: 19),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Center(child: buildVocabularyCard('오이', 'Quả dưa chuột')),
                      SizedBox(height: 10),
                      Center(child: buildVocabularyCard('사과', 'Quả táo')),
                      SizedBox(height: 10),
                      Center(child: buildVocabularyCard('바나나', 'Quả chuối')),
                      SizedBox(height: 10),
                      Center(child: buildVocabularyCard('포도', 'Quả nho')),
                      // Add more vocabulary cards as needed
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 730,
            left: 20,
            child: Container(
              width: 390,
              height: 88,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 20,
                    left: 95,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color.fromRGBO(30, 165, 252, 1),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'Kiểm tra ',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Inter',
                              fontSize: 16,
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

  Widget buildVocabularyCard(String word, String meaning) {
    return Container(
      width: 372,
      height: 133,
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
              width: 67,
              height: 133,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 41,
                    left: 9,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(94, 186, 217, 1),
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(50, 50)),
                      ),
                      child: Icon(Icons.volume_up,
                          color: Colors.white), // Speaker icon
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 305,
            child: Container(
              width: 67,
              height: 133,
              child: Icon(Icons.favorite_border,
                  color: Colors.black, size: 30), // Team icon
            ),
          ),
          Positioned(
            top: 0,
            left: 67,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 35),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 7, vertical: 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          word,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontFamily: 'Inter',
                            fontSize: 20,
                            letterSpacing: -0.3,
                            fontWeight: FontWeight.bold,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          meaning,
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
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: 238,
                    height: 27,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 4,
                          left: 4,
                          child: Text(
                            'Thêm ghi chú',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontFamily: 'Inter',
                              fontSize: 16,
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
