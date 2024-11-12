import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:korastudy_fe/pages/testpage/TestPageListening.dart'; // Import trang TestPageChoose

class ListTestWidget extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> _fetchTests() async {
    QuerySnapshot snapshot = await _firestore.collection('testpage').get();
    List<Map<String, dynamic>> tests = [];

    for (var doc in snapshot.docs) {
      var testData = doc.data() as Map<String, dynamic>;
      var questionsSnapshot =
          await _firestore.collection('testpage/${doc.id}/questions').get();
      if (questionsSnapshot.docs.isNotEmpty) {
        var questionData = questionsSnapshot.docs.first.data();
        if (questionData.containsKey('createdAt') &&
            questionData['createdAt'] != null) {
          Timestamp createdAtTimestamp = questionData['createdAt'];
          DateTime createdAt = createdAtTimestamp.toDate();
          tests.add({
            'id': doc.id,
            'testName': testData['testName'],
            'createdAt': createdAt,
          });
        } else {
          tests.add({
            'id': doc.id,
            'testName': testData['testName'],
            'createdAt': null,
          });
        }
      }
    }

    // Sắp xếp danh sách tests theo thứ tự giảm dần của createdAt
    tests.sort((a, b) {
      DateTime? createdAtA = a['createdAt'];
      DateTime? createdAtB = b['createdAt'];
      if (createdAtA == null && createdAtB == null) return 0;
      if (createdAtA == null) return 1;
      if (createdAtB == null) return -1;
      return createdAtB.compareTo(createdAtA);
    });

    return tests;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Loại bỏ nút quay lại
        backgroundColor: Color.fromRGBO(30, 165, 252, 1),
        title: Text(
          'Danh sách bài thi',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Inter',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: _fetchTests(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Lỗi: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('Không có dữ liệu'));
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return _buildTestItem(context, snapshot.data![index]);
                },
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildTestItem(BuildContext context, Map<String, dynamic> test) {
    DateTime? createdAt = test['createdAt'];
    String formattedDate = createdAt != null
        ? DateFormat('dd/MM/yyyy HH:mm').format(createdAt)
        : 'N/A';

    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8), // Thêm margin để mục không chiếm toàn bộ chiều rộng
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
          Center(
            child: Image.asset(
              'assets/images/user3.jpg',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 16),
          Text(
            test['testName'],
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
            formattedDate,
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TestPageListening(
                      testId: test['id']), // Truyền ID của bài kiểm tra
                ),
              );
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
