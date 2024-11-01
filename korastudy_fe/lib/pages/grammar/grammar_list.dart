import 'package:flutter/material.dart';
import 'package:korastudy_fe/components/selectGrammarCard_component.dart';

class GrammarList extends StatefulWidget {
  @override
  _GrammarListState createState() => _GrammarListState();
}

class _GrammarListState extends State<GrammarList> {
  final List<Map<String, String>> grammarItems = [
    {'title': 'Tiểu từ - Trợ từ - Đại từ'},
    {'title': 'Bất quy tắc và giản lược'},
    {'title': 'Số trong tiếng Hàn'},
    {'title': 'Nguyên nhân - kết quả'},
    {'title': 'Chắc chắn - đương nhiên'},
    {'title': 'Rủ rê - yêu cầu - Đề nghị'},
    {'title': 'Mục đích - Dự định'},
    {'title': 'Suy đoán'},
  ];

  // Getter để lấy tổng số card
  int get totalCards => grammarItems.length;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Column(
        children: [
          for (int i = 0; i < grammarItems.length; i += 3)
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Row(
                mainAxisAlignment: _getMainAxisAlignment(
                    i), // Gọi hàm để xác định cách sắp xếp
                children: _buildCards(i), // Gọi hàm để tạo card
              ),
            ),
        ],
      ),
    );
  }

  // Hàm để xác định cách sắp xếp dựa vào số lượng card
  MainAxisAlignment _getMainAxisAlignment(int startIndex) {
    int count = 0;
    for (int j = startIndex;
        j < startIndex + 3 && j < grammarItems.length;
        j++) {
      count++;
    }
    return count == 2
        ? MainAxisAlignment.start
        : MainAxisAlignment.spaceBetween;
  }

  List<Widget> _buildCards(int startIndex) {
    List<Widget> cards = [];
    List<double> heights = [];

    // Tính chiều cao cho mỗi card
    for (int j = startIndex;
        j < startIndex + 3 && j < grammarItems.length;
        j++) {
      final title = grammarItems[j]['title']!;
      final textPainter = TextPainter(
        text: TextSpan(
          text: title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            height: 1.5,
          ),
        ),
        maxLines: 5, // Giới hạn số dòng
        textDirection: TextDirection.ltr,
      );
      textPainter.layout(maxWidth: 115); // Đặt chiều rộng tối đa cho text

      heights.add(
          textPainter.height + 100); // Thêm chiều cao cho hình ảnh và padding
    }

    double maxHeight =
        (heights.isNotEmpty ? heights.reduce((a, b) => a > b ? a : b) : 150) +
            12;

    // Tạo danh sách các card với chiều cao bằng chiều cao tối đa
    for (int j = startIndex;
        j < startIndex + 3 && j < grammarItems.length;
        j++) {
      cards.add(Container(
        height: maxHeight,
        child: SelectGrammar(
          title: grammarItems[j]['title']!,
        ),
      ));

      // Thêm padding giữa các card nếu chỉ có 2 card trong hàng
      if (j < startIndex + 2 && j < grammarItems.length - 1) {
        cards.add(SizedBox(width: 43)); // Thay đổi chiều rộng nếu cần
      }
    }

    return cards;
  }
}
