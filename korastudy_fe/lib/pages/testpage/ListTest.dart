import 'package:flutter/material.dart';
// Ensure this import is correct

class ListTestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Column(
          children: <Widget>[
            _buildHeader(),
            _buildContent(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      height: 97,
      color: Color.fromRGBO(30, 165, 252, 1),
      child: Center(
        child: Text(
          'Danh sách bài thi',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Inter',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            height: 1,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildTestItem(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTestItem(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            offset: Offset(0, 4),
            blurRadius: 4,
          ),
        ],
        color: Color.fromRGBO(252, 249, 249, 1),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 117,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage('assets/images/Learnnew3.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Topik I -1',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Inter',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              height: 1,
              decoration: TextDecoration.none,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Minh Quang',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Abel',
              fontSize: 15,
              fontWeight: FontWeight.normal,
              height: 1,
              decoration: TextDecoration.none,
            ),
          ),
          SizedBox(height: 5),
          Text(
            '13/05/2024 00:00',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color.fromRGBO(42, 39, 73, 1),
              fontFamily: 'Abel',
              fontSize: 10,
              fontWeight: FontWeight.normal,
              height: 1,
              decoration: TextDecoration.none,
            ),
          ),
          SizedBox(height: 16),
             ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/testPageListening'); // Navigate to TestPageListening
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(30, 165, 252, 1),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'Bắt đầu',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(245, 245, 245, 1),
                  fontFamily: 'Inter',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
              ),
            ),
          
        ],
      ),
    );
  }
}