import 'package:flutter/material.dart';
import 'package:korastudy_fe/widgets/note_dialog.dart';

class Vocabulary_list_meanWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(70, 160, 229, 1),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,size: 30,color: Colors.white,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Danh sách từ vựng',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            buildVocabularyCard('한국', 'Korea', screenWidth, screenHeight, context),
            SizedBox(height: screenHeight * 0.02),
            buildVocabularyCard('베트남', 'Vietnam', screenWidth, screenHeight, context),
            SizedBox(height: screenHeight * 0.02),
            buildVocabularyCard('미국', 'USA', screenWidth, screenHeight, context),
            SizedBox(height: screenHeight * 0.02),
            buildVocabularyCard('영국', 'UK', screenWidth, screenHeight, context),
            SizedBox(height: screenHeight * 0.02),
            buildVocabularyCard('영국', 'UK', screenWidth, screenHeight, context),
            SizedBox(height: screenHeight * 0.02),
            buildVocabularyCard('영국', 'UK', screenWidth, screenHeight, context),
            SizedBox(height: screenHeight * 0.02),
            buildVocabularyCard('영국', 'UK', screenWidth, screenHeight, context),
            SizedBox(height: screenHeight * 0.02),
            buildVocabularyCard('영국', 'UK', screenWidth, screenHeight, context),
            SizedBox(height: screenHeight * 0.02),
            buildVocabularyCard('영국', 'UK', screenWidth, screenHeight, context),
            SizedBox(height: screenHeight * 0.02),
          ],
        ),
      ),
    );
  }

  Widget buildVocabularyCard(String word, String meaning, double screenWidth, double screenHeight, BuildContext context) {
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
                    height: screenHeight * 0.05,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: screenHeight * 0.005,
                          left: screenWidth * 0.01,
                          child: TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return NoteDialog();
                                },
                              );
                            },
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