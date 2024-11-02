import 'package:flutter/material.dart';

class MatchingPage extends StatelessWidget {
  final List<Map<String, String>> wordPairs = [
    {'vietnamese': 'Hàn Quốc', 'korean': '한국'},
    {'vietnamese': 'Việt Nam', 'korean': '베트남'},
    {'vietnamese': 'Mỹ', 'korean': '미국'},
    {'vietnamese': 'Anh', 'korean': '영국'},
  ];

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
        title: Text(
          '1/5',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () {
              // Handle next button press
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              // Progress bar and title
              Column(
                children: [
                  LinearProgressIndicator(
                    value: 0.2, // Replace with dynamic progress value
                    backgroundColor: Colors.grey[300],
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xFF46A0E5)),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Ghép cặp từ - định nghĩa',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Grid of cards
              Container(
                height: MediaQuery.of(context).size.height *
                    0.6, // Adjust height as needed
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 15,
                    childAspectRatio: 2.5,
                  ),
                  itemCount: wordPairs.length * 2,
                  itemBuilder: (context, index) {
                    final wordPair = wordPairs[index ~/ 2];
                    final text = index % 2 == 0
                        ? wordPair['vietnamese']
                        : wordPair['korean'];
                    return _buildCard(text!);
                  },
                ),
              ),
              SizedBox(height: 16),

              // Check button
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
                  'Kiểm tra',
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
      ),
    );
  }

  // Helper function to build individual cards
  Widget _buildCard(String text) {
    return Container(
      padding: EdgeInsets.all(12),
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
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
