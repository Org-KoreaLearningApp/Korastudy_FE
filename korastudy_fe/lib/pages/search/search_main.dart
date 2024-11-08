import 'package:flutter/material.dart';
import 'package:korastudy_fe/components/search_card.dart';
import 'package:korastudy_fe/widgets/search_input.dart';

class SearchScreen extends StatelessWidget {
  final List<Map<String, String>> searchResults = [
    {
      'title': 'Ngữ Pháp',
      'subtitle': 'Tiểu từ - Trợ từ - Đại từ',
      'imageUrl': 'assets/images/grammarlogo.jpg'
    },
    {
      'title': 'Ngữ Pháp',
      'subtitle': 'Tiểu từ - Trợ từ - Đại từ',
      'imageUrl': 'assets/images/grammarlogo.jpg'
    },
    {
      'title': 'Ngữ Pháp',
      'subtitle': 'Tiểu từ - Trợ từ - Đại từ',
      'imageUrl': 'assets/images/grammarlogo.jpg'
    },
    {
      'title': 'Ngữ Pháp',
      'subtitle': 'Tiểu từ - Trợ từ - Đại từ',
      'imageUrl': 'assets/images/grammarlogo.jpg'
    },
    {
      'title': 'Ngữ Pháp',
      'subtitle': 'Tiểu từ - Trợ từ - Đại từ',
      'imageUrl': 'assets/images/grammarlogo.jpg'
    },
    {
      'title': 'Ngữ Pháp',
      'subtitle': 'Tiểu từ - Trợ từ - Đại từ',
      'imageUrl': 'assets/images/grammarlogo.jpg'
    },
    {
      'title': 'Ngữ Pháp',
      'subtitle': 'Tiểu từ - Trợ từ - Đại từ',
      'imageUrl': 'assets/images/grammarlogo.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, // Thay đổi màu của nút back thành trắng
        ),
        title: Text(
          'Tìm Kiếm',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF1EA5FC),
      ),
      backgroundColor: Colors.white, // Thay đổi màu nền thành trắng
      body: Column(
        children: [
          SizedBox(height: 16), // Thay đổi khoảng cách ở đây
          SearchInput(),
          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                return SearchCard(
                  title: searchResults[index]['title']!,
                  subtitle: searchResults[index]['subtitle']!,
                  imageUrl: searchResults[index]['imageUrl']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}