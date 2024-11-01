import 'package:flutter/material.dart';
import 'package:korastudy_fe/components/grammarCard_component.dart';

class GrammarDetailList extends StatelessWidget {
  // Danh sách chứa các dữ liệu cho GrammarCard
  final List<Map<String, String>> grammarDetails = [
    {'title': 'Động từ + 기 전에', 'subtitle': 'Trước, trước khi'},
    {'title': 'Động từ + (으)ㄹ게요', 'subtitle': 'Sẽ'},
    {'title': 'Động từ/tính từ + 겠', 'subtitle': 'Chắc, chắc là'},
    {'title': 'Động từ + 기 전에', 'subtitle': 'Trước, trước khi'},
    {'title': 'Động từ + (으)ㄹ게요', 'subtitle': 'Sẽ'},
    {'title': 'Động từ/tính từ + 겠', 'subtitle': 'Chắc, chắc là'},
    {'title': 'Động từ + 기 전에', 'subtitle': 'Trước, trước khi'},
    {'title': 'Động từ + (으)ㄹ게요', 'subtitle': 'Sẽ'},
    {'title': 'Động từ/tính từ + 겠', 'subtitle': 'Chắc, chắc là'},
    {'title': 'Động từ + 기 전에', 'subtitle': 'Trước, trước khi'},
    {'title': 'Động từ + (으)ㄹ게요', 'subtitle': 'Sẽ'},
    {'title': 'Động từ/tính từ + 겠', 'subtitle': 'Chắc, chắc là'},
    // Thêm nhiều item nếu cần
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: grammarDetails.length,
        itemBuilder: (context, index) {
          final item = grammarDetails[index];
          return Column(
            children: [
              // Thêm SizedBox cho thẻ đầu tiên
              if (index == 0) SizedBox(height: 20),
              GrammarCard(
                title: item['title']!,
                subtitle: item['subtitle']!,
                onLike: () {
                  // Logic khi nhấn nút "Thích"
                  print('Thích: ${item['title']}');
                },
                onCheck: () {
                  // Logic khi nhấn nút "Đọc"
                  print('Đã đọc: ${item['title']}');
                },
              ),
              SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}
