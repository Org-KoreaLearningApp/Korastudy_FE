import 'package:flutter/material.dart';
import 'TestPageResults.dart'; // Import trang kết quả

class TestPageFinalWidget extends StatelessWidget {
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
        widthFactor: 0.66, // Tỷ lệ chiều rộng
        child: Container(
          color: Color.fromRGBO(63, 204, 251, 1),
        ),
      ),
    );
  }

  Widget _buildConfirmationBox(BuildContext context) {
    return Expanded(
      child: Center(
        child: Container(
          width: 344,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                offset: Offset(4, 4),
                blurRadius: 4,
              ),
            ],
            color: Colors.white,
            border: Border.all(
              color: Colors.black,
              width: 0.25,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Bạn chắc chắn muốn nộp bài?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Inter',
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 20),
              _buildSubmitButton(context),
              SizedBox(height: 10),
              _buildCancelButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ResultsScreen()),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromRGBO(30, 165, 252, 1),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Text(
          'Nộp bài',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color.fromRGBO(245, 245, 245, 1),
            fontFamily: 'Inter',
            fontSize: 18,
            fontWeight: FontWeight.normal,
            height: 1.5,
          ),
        ),
      ),
    );
  }

  Widget _buildCancelButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context); // Quay lại trang trước đó
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Text(
          'Hủy bỏ',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Inter',
            fontSize: 18,
            fontWeight: FontWeight.normal,
            height: 1.5,
          ),
        ),
      ),
    );
  }
}