import 'package:flutter/material.dart';
import 'TestPageFinal.dart'; // Import trang cuối

class TestPageChooseWidget extends StatefulWidget {
  @override
  _TestPageChooseWidgetState createState() => _TestPageChooseWidgetState();
}

class _TestPageChooseWidgetState extends State<TestPageChooseWidget> {
  String? _selectedAnswer; // Cho phép giá trị null
  final String _correctAnswer = 'A'; // Đáp án đúng
  int _currentPage = 0; // Trang hiện tại
  final int _totalPages = 3; // Tổng số trang kiểm tra
  PageController _pageController = PageController();

  void _onAnswerSelected(String answer) {
    setState(() {
      _selectedAnswer = answer;
    });

    // Chuyển sang trang tiếp theo sau khi chọn đáp án
    Future.delayed(Duration(seconds: 1), () {
      if (_currentPage < _totalPages - 1) {
        setState(() {
          _currentPage++;
          _selectedAnswer = null; // Reset đáp án đã chọn
        });
        _pageController.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TestPageFinalWidget()),
        );
      }
    });
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Bạn có muốn thoát?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('Hủy'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Đồng ý'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0), // Điều chỉnh chiều cao của AppBar
          child: AppBar(
            backgroundColor: Color.fromRGBO(30, 165, 252, 1), // Đặt màu AppBar
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Câu ${_currentPage + 1}',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.access_time, color: Colors.black, size: 16), // Icon đồng hồ nhỏ
                    SizedBox(width: 4),
                    Text(
                      '00:32',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            centerTitle: false, // Căn trái tiêu đề
          ),
        ),
        body: Container(
          width: 390,
          height: 844,
          color: Colors.white,
          child: Column(
            children: [
              _buildProgressBar(),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: NeverScrollableScrollPhysics(), // Ngăn người dùng cuộn thủ công
                  children: List.generate(_totalPages, (index) => _buildQuestionBox(index + 1)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressBar() {
    return Container(
      width: 390,
      height: 7,
      color: Color.fromRGBO(158, 205, 221, 1),
      child: FractionallySizedBox(
        widthFactor: (_currentPage + 1) / _totalPages, // Tỷ lệ chiều rộng
        child: Container(
          color: Color.fromRGBO(63, 204, 251, 1),
        ),
      ),
    );
  }

  Widget _buildQuestionBox(int questionNumber) {
    return Container(
      margin: EdgeInsets.only(top: 65),
      width: 344,
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
      ),
      child: Column(
        children: [
          _buildQuestionHeader(questionNumber),
          _buildAnswerOptions(),
        ],
      ),
    );
  }

  Widget _buildQuestionHeader(int questionNumber) {
    return Container(
      width: 344,
      height: 89,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        color: Color.fromRGBO(135, 185, 231, 1),
      ),
      padding: EdgeInsets.all(14),
      child: Text(
        'Đây là câu hỏi số $questionNumber',
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Inter',
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildAnswerOptions() {
    return Column(
      children: [
        _buildAnswerOption('A', 'Đáp án A'),
        _buildAnswerOption('B', 'Đáp án B'),
        _buildAnswerOption('C', 'Đáp án C'),
        _buildAnswerOption('D', 'Đáp án D'),
      ],
    );
  }

  Widget _buildAnswerOption(String label, String text) {
    return GestureDetector(
      onTap: () => _onAnswerSelected(label),
      child: Container(
        decoration: BoxDecoration(
          color: _selectedAnswer == label ? Colors.yellow : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          children: [
            Container(
              width: 33,
              height: 33,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _selectedAnswer == label ? Colors.yellow : Colors.white,
                border: Border.all(color: Colors.black, width: 1.5),
              ),
            ),
            SizedBox(width: 10),
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
      ),
    );
  }
}