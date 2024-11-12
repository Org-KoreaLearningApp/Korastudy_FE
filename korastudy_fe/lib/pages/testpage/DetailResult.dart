import 'package:flutter/material.dart';

class DetailResultWidget extends StatelessWidget {
  final List<Map<String, dynamic>> results;

  const DetailResultWidget({Key? key, required this.results}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listeningResults = results
        .where((result) => result['questionType'] == 'listening')
        .toList();
    final readingResults =
        results.where((result) => result['questionType'] == 'reading').toList();

    final listeningCorrect =
        listeningResults.where((result) => result['correct'] == true).length;
    final readingCorrect =
        readingResults.where((result) => result['correct'] == true).length;

    final double listeningPercentage = listeningResults.isNotEmpty
        ? (listeningCorrect / listeningResults.length) * 100
        : 0.0;
    final double readingPercentage = readingResults.isNotEmpty
        ? (readingCorrect / readingResults.length) * 100
        : 0.0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Đánh giá chi tiết'),
        backgroundColor: Color.fromRGBO(94, 186, 217, 1),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        color: Colors.white,
        child: Column(
          children: [
            _buildHeader(),
            _buildContent(listeningPercentage, readingPercentage),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16),
      color: Color.fromRGBO(94, 186, 217, 1),
      child: Center(
        child: Text(
          'Đánh giá chi tiết',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildContent(double listeningPercentage, double readingPercentage) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildRow('Listening', listeningPercentage),
          _buildRow('Reading', readingPercentage),
        ],
      ),
    );
  }

  Widget _buildRow(String title, double percentage) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
          _buildProgressBar(percentage),
        ],
      ),
    );
  }

  Widget _buildProgressBar(double percentage) {
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
              '${percentage.toStringAsFixed(1)}%',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
