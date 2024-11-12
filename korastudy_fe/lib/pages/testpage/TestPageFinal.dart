import 'package:flutter/material.dart';
import 'TestPageResults.dart'; // Import trang kết quả
import 'TestPageChoose.dart'; // Import tệp chứa định nghĩa Question

class TestPageFinalWidget extends StatelessWidget {
  final int totalScore;
  final int listeningScore;
  final int readingScore;
  final List<Question> questions;
  final List<String?> selectedAnswers;

  const TestPageFinalWidget({
    Key? key,
    required this.totalScore,
    required this.listeningScore,
    required this.readingScore,
    required this.questions,
    required this.selectedAnswers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            _buildHeader(),
            _buildProgressBar(),
            _buildConfirmationBox(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      height: 127,
      color: Color.fromRGBO(30, 165, 252, 1),
      child: Center(
        child: Text(
          'Nộp bài?',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Inter',
            fontSize: 20,
            letterSpacing: -0.3,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildProgressBar() {
    return Container(
      width: double.infinity,
      height: 7,
      color: Color.fromRGBO(158, 205, 221, 1),
      child: FractionallySizedBox(
        widthFactor: 1.0,
        child: Container(
          color: Color.fromRGBO(63, 204, 251, 1),
        ),
      ),
    );
  }

  Widget _buildConfirmationBox(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(
            'Bạn có chắc chắn muốn nộp bài?',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Inter',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Hủy'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultsScreen(
                        totalScore: totalScore,
                        listeningScore: listeningScore,
                        readingScore: readingScore,
                        results: _buildResults(), // Truyền tham số results
                      ),
                    ),
                  );
                },
                child: Text('Nộp bài'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> _buildResults() {
    List<Map<String, dynamic>> results = [];
    for (int i = 0; i < questions.length; i++) {
      results.add({
        'question': questions[i].questionText,
        'correct': selectedAnswers[i] == questions[i].correctAnswer,
        'answer': selectedAnswers[i] ?? '',
        'score': questions[i].score,
      });
    }
    return results;
  }
}
