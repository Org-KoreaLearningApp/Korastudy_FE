// lib/pages/vocabulary/vocabulary_list.dart
import 'package:flutter/material.dart';
import 'package:korastudy_fe/models/vocabulary_model.dart';
import 'package:korastudy_fe/pages/vocabulary/flashcard.dart';
import 'package:korastudy_fe/pages/vocabulary/test_splash.dart';
import 'package:korastudy_fe/services/firestore_service.dart';
import 'package:korastudy_fe/pages/vocabulary/vocabulary_list_mean.dart';
import 'package:korastudy_fe/pages/vocabulary/test_splash.dart';
import 'package:korastudy_fe/pages/vocabulary/flashcard.dart';
import 'package:korastudy_fe/pages/vocabulary/dictionary_verb.dart';

class VocabularyListWidget extends StatefulWidget {
  @override
  _VocabularyListWidgetState createState() => _VocabularyListWidgetState();
}

class _VocabularyListWidgetState extends State<VocabularyListWidget> {
  final FirestoreService _firestoreService = FirestoreService();
  late Future<List<VocabularySet>> _vocabularySets;

  @override
  void initState() {
    super.initState();
    _vocabularySets = _firestoreService.getVocabularySets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Từ Vựng',
          style: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
            fontFamily: 'Inter',
            fontSize: 24,
            letterSpacing: -0.3,
            fontWeight: FontWeight.bold,
            height: 1,
          ),
        ),
        centerTitle: true, // Căn giữa tiêu đề
        backgroundColor: Color.fromRGBO(30, 165, 252, 1),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 30,
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              size: 30,
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DictionaryVerbWidget()), // Trang tiếp theo
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
              child: Container(
                // Add padding to the top
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          DropdownButton<String>(
                            value: 'Cấp độ 1', // Initial selected value
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: Color.fromRGBO(0, 0, 0, 1),
                              size: 20,
                            ),
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              letterSpacing: -0.3,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(0, 0, 0, 1),
                            ),
                            dropdownColor: Color.fromRGBO(255, 255, 255, 1),
                            borderRadius: BorderRadius.circular(10),
                            underline: SizedBox(), // Removes the underline
                            items: <String>['Cấp độ 1', 'Cấp độ 2', 'Cấp độ 3']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              // Handle the value change
                            },
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Color.fromRGBO(0, 0, 0, 1),
                              backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                              shadowColor: Color.fromRGBO(0, 0, 0, 0.25),
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              minimumSize: Size(111, 40),
                            ),
                            onPressed: () {
                              // Add your onPressed code here!
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TestPage()), // Replace with your next page
                              );
                            },
                            child: Text(
                              'Kiểm tra',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 16,
                                letterSpacing: -0.3,
                                fontWeight: FontWeight.bold,
                                height: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 374,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            offset: Offset(0, 4),
                            blurRadius: 4,
                          ),
                        ],
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 85,
                            height: 86,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/vocab.png'),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Từ vựng mới cấp\nTOPK 1  (838)',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Inter',
                                  fontSize: 20,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                  height: 1,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '0/838',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Inter',
                                  fontSize: 16,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                  height: 1,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    FutureBuilder<List<VocabularySet>>(
                      future: _vocabularySets,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(child: Text('Lỗi: ${snapshot.error}'));
                        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          return Center(child: Text('Không có dữ liệu'));
                        } else {
                          return GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3, // Số cột trong lưới
                              crossAxisSpacing: 10.0, // Khoảng cách giữa các cột
                              mainAxisSpacing: 10.0, // Khoảng cách giữa các hàng
                              childAspectRatio: 0.75, // Tỉ lệ chiều rộng/chiều cao của các ô
                            ),
                            padding: EdgeInsets.all(10.0),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              final vocabularySet = snapshot.data![index];
                              return buildLessonCard(context, vocabularySet);
                            },
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {
                      // Xử lý sự kiện khi nhấn vào biểu tượng quiz
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                TestPage()), // Replace with your next page
                      );
                    },
                    borderRadius: BorderRadius.circular(50),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.lightBlue,
                      child: Icon(
                        Icons.headset, // Icon hình câu hỏi
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  SizedBox(height: 16), // Khoảng cách giữa các biểu tượng
                  InkWell(
                    onTap: () {
                      // Xử lý sự kiện khi nhấn vào biểu tượng quiz
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                FlashcardPage()), // Replace with your next page
                      );
                    },
                    borderRadius: BorderRadius.circular(50),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.lightBlue,
                      child: Icon(
                        Icons.quiz, // Icon hình câu hỏi
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLessonCard(BuildContext context, VocabularySet vocabularySet) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VocabularyListMeanWidget(setId: vocabularySet.id),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(8), // Add padding to avoid overflow
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              offset: Offset(0, 4),
              blurRadius: 4,
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(-4, -4),
              blurRadius: 4,
              spreadRadius: -4,
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 85,
              height: 86,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/vocab.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              vocabularySet.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Inter',
                fontSize: 16,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}