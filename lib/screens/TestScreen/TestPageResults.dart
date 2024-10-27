import 'package:flutter/material.dart';
import 'package:korean_learning_app/screens/TestScreen/DetailResult.dart';
import 'package:korean_learning_app/screens/TestScreen/ShowResult.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int totalScore = 110;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: _buildAppBar(context),
        body: _buildBody(context, totalScore),
        bottomNavigationBar: _buildActionsSection(context),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 54,
      backgroundColor: Color(0XFF1EA5FC),
      automaticallyImplyLeading: false,
      leadingWidth: 44,
      leading: Padding(
        padding: EdgeInsets.only(left: 10),
        child: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 26,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      centerTitle: true,
      title: Text(
        "Kết quả",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, int totalScore) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 50),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "한국어능력시험 성적증명서\nOFFICIAL TOPIK SCORE REPORT",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 44),
                  _buildTestResultsSection(context, totalScore),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTestResultsSection(BuildContext context, int totalScore) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 0.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(4, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "시험 결과 (Test Result)",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                _buildResultColumn("영역\nSection"),
                _buildResultColumn("점수\nScore"),
                _buildResultColumn("총점\nTotal Score"),
                _buildResultColumn("등급\nLevel"),
              ],
            ),
          ),
          SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      _buildResultRow("듣기 \nListening", "25/100"),
                      _buildResultRow("읽기 \nReading", "25/100"),
                    ],
                  ),
                ),
                _buildTotalScoreColumn("50/200"),
                _buildTotalScoreColumn("X"),
              ],
            ),
          ),
          SizedBox(height: 22),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 50),
            padding: EdgeInsets.symmetric(horizontal: 44),
            child: Column(
              children: [
                Text(
                  "총 점수 $totalScore 자격을 갖춘 (Pass score: $totalScore)",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 22),
                _buildPassStatusButton(context),
              ],
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildResultColumn(String text) {
    return Container(
      width: 83,
      height: 46,
      padding: EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 0.75),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 10,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultRow(String section, String score) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Container(
            width: 84,
            height: 46,
            padding: EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
            ),
            child: Column(
              children: [
                Text(
                  section,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          _buildScoreButton(score),
        ],
      ),
    );
  }

  Widget _buildScoreButton(String score) {
    return Container(
      width: 83,
      height: 46,
      padding: EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Text(
        score,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 10,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildTotalScoreColumn(String score) {
    return Container(
      width: 83,
      height: 91,
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            score,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 10,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPassStatusButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 54,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.black, width: 1.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
        ),
        onPressed: () {},
        child: Text(
          "Not Passed",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _buildActionsSection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.black, width: 1),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildShowAnswersButton(context),
          SizedBox(height: 16),
          _buildDetailedEvaluationButton(context),
        ],
      ),
    );
  }

  Widget _buildShowAnswersButton(BuildContext context) {
    return Container(
      width: 200,
      height: 42,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0XFF1EA5FC),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ShowResultScreen()),
          );
        },
        child: Text(
          "Hiển thị đáp án",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _buildDetailedEvaluationButton(BuildContext context) {
    return Container(
      width: 200,
      height: 42,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0XFF1EA5FC),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailResultWidget()),
          );
        },
        child: Text(
          "Đánh giá chi tiết",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}