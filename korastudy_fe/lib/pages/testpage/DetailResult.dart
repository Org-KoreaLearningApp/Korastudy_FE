      import 'package:flutter/material.dart';
      
      class DetailResultWidget extends StatelessWidget {
        @override
        Widget build(BuildContext context) {
          return Scaffold(
            body: Container(
              width: 390,
              height: 907,
              color: Colors.white,
              child: Column(
                children: [
                  _buildHeader(),
                  _buildContent(),
                ],
              ),
            ),
          );
        }
      
        Widget _buildHeader() {
          return Container(
            width: 390,
            height: 97,
            color: Color.fromRGBO(94, 186, 217, 1),
            child: Center(
              child: Text(
                'Đánh giá chi tiết',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Inter',
                  fontSize: 20,
                  letterSpacing: -0.3,
                  fontWeight: FontWeight.normal,
                  height: 1,
                ),
              ),
            ),
          );
        }
      
        Widget _buildContent() {
          return Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                _buildRow('Nghe hiểu', _buildProgressBar(80)),
                _buildRow('Chọn đáp án đúng', _buildProgressBar(70)),
                _buildRow('Tìm câu nối tiếp', _buildProgressBar(60)),
                _buildRow('Tìm địa điểm', _buildProgressBar(50)),
                _buildRow('Chủ đề hội thoại', _buildProgressBar(40)),
                _buildRow('Chọn tranh đúng', _buildProgressBar(30)),
                _buildRow('Nội dung hội thoại', _buildProgressBar(20)),
                _buildRow('Chọn suy nghĩ', _buildProgressBar(10)),
                _buildRow('Hội thoại ngắn', _buildProgressBar(90)),
                _buildRow('Chủ đề câu hỏi', _buildProgressBar(80)),
                _buildRow('Đoạn vắn ngắn (khó)', _buildProgressBar(70)),
                _buildRow('Điền vào chỗ trống', _buildProgressBar(60)),
                _buildRow('Chọn đáp án sai', _buildProgressBar(50)),
                _buildRow('Câu hỏi suy luận', _buildProgressBar(40)),
                _buildRow('Đoạn văn ngắn (dễ)', _buildProgressBar(30)),
                _buildRow('Sắp xếp', _buildProgressBar(20)),
                
                _buildRow('Đọc hiểu', _buildProgressBar(100)),
                _buildRow('Chọn đáp án đúng', _buildProgressBar(70)),
                _buildRow('Tìm câu nối tiếp', _buildProgressBar(60)),
                _buildRow('Tìm địa điểm', _buildProgressBar(50)),
                _buildRow('Chủ đề hội thoại', _buildProgressBar(40)),
                _buildRow('Chọn tranh đúng', _buildProgressBar(30)),
                _buildRow('Nội dung hội thoại', _buildProgressBar(20)),
                _buildRow('Chọn suy nghĩ', _buildProgressBar(10)),
                _buildRow('Hội thoại ngắn', _buildProgressBar(90)),
                _buildRow('Chủ đề câu hỏi', _buildProgressBar(80)),
                _buildRow('Đoạn vắn ngắn (khó)', _buildProgressBar(70)),
                _buildRow('Điền vào chỗ trống', _buildProgressBar(60)),
                _buildRow('Chọn đáp án sai', _buildProgressBar(50)),
                _buildRow('Câu hỏi suy luận', _buildProgressBar(40)),
                _buildRow('Đoạn văn ngắn (dễ)', _buildProgressBar(30)),
                _buildRow('Sắp xếp', _buildProgressBar(20)),
              ],
            ),
          );
        }
      
        Widget _buildRow(String text, Widget? progressBar) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Inter',
                    fontSize: 16,
                    letterSpacing: -0.3,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                ),
                if (progressBar != null) progressBar,
              ],
            ),
          );
        }
      
        Widget _buildProgressBar(int percentage) {
          return Container(
            width: 137,
            height: 28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color.fromRGBO(213, 213, 213, 1),
            ),
            child: Stack(
              children: [
                Container(
                  width: 137 * (percentage / 100),
                  height: 28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color.fromRGBO(94, 186, 217, 1),
                  ),
                ),
                Center(
                  child: Text(
                    '$percentage%',
                    style: TextStyle(
                      color: Colors.black,
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
          );
        }
      }