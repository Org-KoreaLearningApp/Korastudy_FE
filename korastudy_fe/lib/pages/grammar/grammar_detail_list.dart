import 'package:flutter/material.dart';
import 'package:korastudy_fe/components/Grammar_content_component.dart';
import 'package:korastudy_fe/components/grammarCard_component.dart';

class GrammarDetailList extends StatelessWidget {
  final List<Map<String, String>> grammarDetails = [
    {
      'title': 'Động từ + 기 전에',
      'subtitle': 'Trước, trước khi',
      'content':
          'Nội dung chi tiết về cấu trúc ngữ pháp này. Ví dụ: khi bạn muốn nói "Trước khi làm điều gì đó" bằng tiếng Hàn.'
    },
    {
      'title': 'Động từ + (으)ㄹ게요',
      'subtitle': 'Sẽ',
      'content':
          'Nội dung chi tiết về cấu trúc ngữ pháp này. Ví dụ: sử dụng để diễn tả ý chí của người nói.'
    },
    {
      'title': 'Động từ/tính từ + 겠',
      'subtitle': 'Chắc, chắc là',
      'content':
          'Nội dung chi tiết về cấu trúc ngữ pháp này. Ví dụ: diễn tả một giả định hay một dự đoán.'
    },
    {
      'title': 'Tiểu từ + 는/은',
      'subtitle': 'Chủ thể của hành động',
      'content':
          'Là tiểu từ gắn vào sau danh từ để chỉ ra danh từ đó chính là chủ thể của hành động.\n'
              '* Danh từ không có patchim + 는\n'
              '고양이는 귀엽습니다.\n'
              '/goyanggineun gwiyeopseupnida./\n'
              'Con mèo dễ thương.\n'
              '마리아 씨는 중국 사람입니까?\n'
              '/maria ssineun jungguk saramipnikka?/\n'
              'Maria là người Trung Quốc phải không?\n'
              'Danh từ có patchim + 은\n'
              '흐엉은 학생입니다.\n'
              '/heueongeun haksaengipnida./\n'
              'Hương là học sinh.'
    },
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
              if (index == 0) SizedBox(height: 20),
              GrammarCard(
                title: item['title']!,
                subtitle: item['subtitle']!,
                onLike: () {
                  print('Thích: ${item['title']}');
                },
                onCheck: () {
                  // Mở ModalBottomSheet khi nhấn vào card
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return Container(
                        padding:
                            const EdgeInsets.all(16.0), // Padding cho nội dung
                        height: MediaQuery.of(context).size.height *
                            0.5, // Chiều cao là 1 nửa trang
                        child: SingleChildScrollView(
                          // Thêm ScrollView nếu nội dung dài
                          child: GrammarContent(
                            title: item['title']!,
                            subtitle: item['subtitle']!,
                            content: item['content']!, // Truyền nội dung
                          ),
                        ),
                      );
                    },
                  );
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
