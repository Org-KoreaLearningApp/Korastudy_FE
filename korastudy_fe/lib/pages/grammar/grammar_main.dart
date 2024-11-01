import 'package:flutter/material.dart';
import 'package:korastudy_fe/widgets/search_input.dart';

class GrammarMain extends StatefulWidget {
  const GrammarMain({super.key});

  @override
  _GrammarMainState createState() => _GrammarMainState();
}

class _GrammarMainState extends State<GrammarMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            SizedBox(height: 20),
            SearchInput(),
            SizedBox(height: 20),
            _buildCategoryRow(),
            SizedBox(height: 20),
            _buildContentCard("Theo biểu hiện (303)",
                "assets/images/Vocabularyremovebgpreview1.png", "1/303"),
            SizedBox(height: 20),
            _buildCardGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      height: 120,
      padding: EdgeInsets.only(
          top: MediaQuery.of(context)
              .padding
              .top), // Adjusts for status bar height
      decoration: BoxDecoration(
        color: Color.fromRGBO(30, 165, 252, 1),
        boxShadow: [
          BoxShadow(color: Colors.black26, offset: Offset(0, 4), blurRadius: 4),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Expanded(
            child: Center(
              child: Text(
                'Ngữ pháp',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(width: 48), // Placeholder to balance the layout
        ],
      ),
    );
  }

  // Rest of your code remains unchanged...
}

Widget _buildCategoryRow() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildCategoryButton('Theo biểu hiện'),
        _buildCategoryButton('Tiểu từ - Trợ từ - Đại từ'),
        _buildCategoryButton('Bất quy tắc và giản lược'),
      ],
    ),
  );
}

Widget _buildCategoryButton(String text) {
  return Container(
    padding: EdgeInsets.all(8),
    width: 115,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(color: Colors.black26, offset: Offset(0, 4), blurRadius: 4)
      ],
    ),
    child: Center(
      child: Text(text,
          textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
    ),
  );
}

Widget _buildContentCard(String title, String imagePath, String count) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: Container(
      padding: EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.black26, offset: Offset(0, 4), blurRadius: 4)
        ],
      ),
      child: Row(
        children: [
          Image.asset(imagePath, width: 85, height: 85),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 20)),
              SizedBox(height: 10),
              Text(count, style: TextStyle(fontSize: 16)),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _buildCardGrid() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: Wrap(
      spacing: 8,
      runSpacing: 8,
      children: List.generate(
          3, (index) => _buildCategoryButton("Card ${index + 1}")),
    ),
  );
}
