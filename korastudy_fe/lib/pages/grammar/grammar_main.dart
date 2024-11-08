import 'package:flutter/material.dart';
import 'package:korastudy_fe/components/totalGrammarCard_component.dart';
import 'package:korastudy_fe/pages/grammar/grammar_list.dart';
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
            _buildTopButtons(),
            SizedBox(height: 20),
            TotalGrammar(
              title: "Ngữ pháp cấp độ 1",
              counterText: "0/300", // Sử dụng getter từ instance
            ),
            SizedBox(height: 20),
            GrammarList() // Đưa instance vào đây
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      height: 110,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
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
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(width: 48),
        ],
      ),
    );
  }

  Widget _buildTopButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(child: _buildPopupButton('Cấp 1')),
          Spacer(),
          Expanded(
              child: _buildCategoryButton('Bài tập', borderColor: Colors.blue)),
        ],
      ),
    );
  }

  Widget _buildPopupButton(String text) {
    return PopupMenuButton<String>(
      color: Colors.white,
      onSelected: (value) {
        print("Selected level: $value");
      },
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(
              value: 'Cấp 1',
              child:
                  Text('Cấp 1', style: TextStyle(fontWeight: FontWeight.bold))),
          PopupMenuItem(
              value: 'Cấp 2',
              child:
                  Text('Cấp 2', style: TextStyle(fontWeight: FontWeight.bold))),
          PopupMenuItem(
              value: 'Cấp 3',
              child:
                  Text('Cấp 3', style: TextStyle(fontWeight: FontWeight.bold))),
        ];
      },
      child: Container(
        padding: EdgeInsets.all(8),
        width: 115,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.black26, offset: Offset(0, 4), blurRadius: 4),
          ],
        ),
        child: Center(
          child: Text(text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold)), // Đặt fontWeight ở đây
        ),
      ),
    );
  }

  Widget _buildCategoryButton(String text,
      {Color borderColor = Colors.transparent}) {
    return Container(
      padding: EdgeInsets.all(8),
      width: 115,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor, width: 2),
        boxShadow: [
          BoxShadow(color: Colors.black26, offset: Offset(0, 4), blurRadius: 4),
        ],
      ),
      child: Center(
        child: Text(text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold)), // Đặt fontWeight ở đây
      ),
    );
  }
}