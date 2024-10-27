import 'package:flutter/material.dart';
import 'package:korastudy_fe/components/pageview_component.dart';

class FulltestContent extends StatefulWidget {
  @override
  _FulltestContentState createState() => _FulltestContentState();
}

class _FulltestContentState extends State<FulltestContent> {
  final List<Map<String, String>> updates = [
    {
      'title': 'Topik 3 Khóa học online hay',
      'subtitle': 'Minh Quang',
      'date': '13/05/2024 00:00',
      'imagePath': 'assets/images/LEARN NEW 3.jpg',
    },
    {
      'title': 'Topik 3 Khóa học online hay và hấp dẫn',
      'subtitle': 'Phan Tứ',
      'date': '14/05/2024 00:00',
      'imagePath': 'assets/images/LEARN NEW 3.jpg',
    },
    {
      'title': 'Topik 3 Khóa học online hay và bổ ích',
      'subtitle': 'Quân Hùng',
      'date': '14/05/2024 00:00',
      'imagePath': 'assets/images/LEARN NEW 3.jpg',
    },
    {
      'title': 'Topik 3 Khóa học online hay và bổ ích',
      'subtitle': 'Quân Hùng',
      'date': '14/05/2024 00:00',
      'imagePath': 'assets/images/LEARN NEW 3.jpg',
    },
    {
      'title': 'Topik 3 Khóa học online hay và bổ ích',
      'subtitle': 'Quân Hùng',
      'date': '14/05/2024 00:00',
      'imagePath': 'assets/images/LEARN NEW 3.jpg',
    },
    {
      'title': 'Topik 3 Khóa học online hay và hấp dẫn',
      'subtitle': 'Phan Tứ',
      'date': '14/05/2024 00:00',
      'imagePath': 'assets/images/LEARN NEW 3.jpg',
    },
    {
      'title': 'Topik 3 Khóa học online hay và hấp dẫn',
      'subtitle': 'Phan Tứ',
      'date': '14/05/2024 00:00',
      'imagePath': 'assets/images/LEARN NEW 3.jpg',
    },
    {
      'title': 'Topik 3 Khóa học online hay và hấp dẫn',
      'subtitle': 'Phan Tứ',
      'date': '14/05/2024 00:00',
      'imagePath': 'assets/images/LEARN NEW 3.jpg',
    },
    {
      'title': 'Topik 3 Khóa học online hay và hấp dẫn',
      'subtitle': 'Phan Tứ',
      'date': '14/05/2024 00:00',
      'imagePath': 'assets/images/LEARN NEW 3.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildHeader(),
          _buildContentCards(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Full Test',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color.fromRGBO(17, 12, 38, 1),
              fontFamily: 'Inter',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none,
              height: 1,
            ),
          ),
          Spacer(),
          _buildSeeAllButton(),
        ],
      ),
    );
  }

  Widget _buildSeeAllButton() {
    return TextButton(
      onPressed: () {
        // Xử lý hành động khi nhấn nút "Xem thêm"
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Xem thêm',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Color.fromRGBO(116, 118, 136, 1),
              fontFamily: 'Abel',
              fontSize: 11,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none,
            ),
          ),
          SizedBox(width: 4),
          Icon(Icons.arrow_drop_down,
              size: 11, color: Color.fromRGBO(116, 118, 136, 1)),
        ],
      ),
    );
  }

  Widget _buildContentCards() {
    return Container(
      height: 220,
      child: PageView.builder(
        itemCount: updates.length > 5
            ? 5
            : updates.length, // Giới hạn số lượng card tối đa là 5
        controller: PageController(viewportFraction: 0.82),
        itemBuilder: (context, index) {
          final update = updates[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1, // Blur radius cho hiệu ứng mờ
                    offset: Offset(1, 2),
                  ),
                ],
              ),
              child: FrameSlideComponent(
                title: update['title']!,
                subtitle: update['subtitle']!,
                date: update['date']!,
                imagePath: update['imagePath']!,
              ),
            ),
          );
        },
      ),
    );
  }
}
