import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF46A0E5),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image of the girl
            Image.asset(
              'assets/images/girl_studying.png', // Replace with your image path
              height: 200,
            ),
            SizedBox(height: 16),

            // Card with title and subtitle
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'Bài Kiểm tra',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF46A0E5),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Ghép cặp từ và định nghĩa',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            // Tip section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Tip : Làm bài kiểm tra và học bằng flashcard sẽ nhanh chóng giúp bạn nắm vững bài học',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ),
            SizedBox(height: 24),

            // Vocabulary selection row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Số từ vựng : ',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  child: DropdownButton<String>(
                    value: '20', // Initial selected value
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    underline: SizedBox(), // Removes the underline
                    items: <String>['10', '20', '30', '40']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      // Handle the value change
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),

            // Start button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color(0xFF46A0E5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              ),
              onPressed: () {
                // Add your onPressed code here!
              },
              child: Text(
                'Bắt đầu nào',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
