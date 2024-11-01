import 'package:flutter/material.dart';
import 'package:korastudy_fe/pages/grammar/grammar_detail_list.dart';
import 'package:korastudy_fe/widgets/search_input.dart';

class GrammarDetail extends StatelessWidget {
  final String title; // Để hiển thị trên AppBar

  GrammarDetail({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromRGBO(30, 165, 252, 1),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: Colors.white, // Đặt màu nền thành trắng
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SearchInput(),
            ),
            Expanded(
              child: GrammarDetailList(),
            ),
          ],
        ),
      ),
    );
  }
}
