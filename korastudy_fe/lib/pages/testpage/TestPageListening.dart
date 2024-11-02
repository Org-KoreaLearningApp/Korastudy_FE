import 'package:flutter/material.dart';
import 'TestPageChoose.dart'; // Import màn hình TestPageChoose

class TestPageListening extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Color.fromRGBO(30, 165, 252, 1), // Set the AppBar color
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back, // Use the back arrow icon
            color: Colors.white, // Change the color to white
          ),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        title: Container(
          child: Text(
            'Test Page Listening',
            style: TextStyle(
              fontWeight: FontWeight.bold, // Make the text bold
              fontSize: 24, // Make the text smaller
              color: Colors.white, // Change the color to white
            ),
          ),
        ),
        centerTitle: true, // Center the title
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          // Remove the border
        ),
        child: Column(
          children: [
            _buildProgressBar(),
            _buildContent(context), // Pass context to _buildContent
          ],
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
        widthFactor: 0.2, // 20% width
        child: Container(
          color: Color.fromRGBO(63, 204, 251, 1),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(),
            SizedBox(height: 16),
            _buildInstruction(),
            SizedBox(height: 16),
            _buildQuestionBox(),
            Spacer(),
            _buildContinueButton(context), // Pass context to the button
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      'Chọn đáp án đúng',
      style: TextStyle(
        color: Colors.black,
        fontFamily: 'Inter',
        fontSize: 20,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  Widget _buildInstruction() {
    return Text(
      '(1~4) 다음을 듣고 <보기>와 같이 물음에 맞는 답을 고르십시오.',
      style: TextStyle(
        color: Colors.black,
        fontFamily: 'Inter',
        fontSize: 20,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  Widget _buildQuestionBox() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
            color: Colors.black, width: 0.7), // Keep the border for <보기>
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildQuestionTitle(),
          SizedBox(height: 16),
          _buildQuestionText('가: 물이에요?'),
          _buildQuestionText('나:______________'),
          SizedBox(height: 16),
          _buildAnswerOption('A', '네, 저예요'),
          _buildAnswerOption('B', '네, 저예요'),
          _buildAnswerOption('C', '네, 저예요'),
          _buildAnswerOption('D', '네, 저예요'),
        ],
      ),
    );
  }

  Widget _buildQuestionTitle() {
    return Center(
      child: Text(
        '<보기>',
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Inter',
          fontSize: 18,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildQuestionText(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black,
        fontFamily: 'Inter',
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  Widget _buildAnswerOption(String label, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          _buildAnswerCircle(label),
          SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Inter',
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnswerCircle(String label) {
    return Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 1.5),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Inter',
            fontSize: 9,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    TestPageChooseWidget()), // Navigate to TestPageChoose
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromRGBO(30, 165, 252, 1),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide.none, // Remove the stroke
          ),
        ),
        child: Text(
          'Tiếp tục',
          style: TextStyle(
            color: Color.fromRGBO(245, 245, 245, 1),
            fontFamily: 'Inter',
            fontSize: 15,
            fontWeight: FontWeight.bold,
            height: 1.5,
          ),
        ),
      ),
    );
  }
}
