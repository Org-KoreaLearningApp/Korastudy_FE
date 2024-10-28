import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class FlashcardPage extends StatefulWidget {
  @override
  _FlashcardPageState createState() => _FlashcardPageState();
}

class _FlashcardPageState extends State<FlashcardPage> {
  final List<String> words = ['한국', '베트남', '미국', '영국'];
  final List<String> meanings = ['Korea', 'Vietnam', 'USA', 'UK'];
  
  int currentIndex = 0;
  int knownCount = 0;
  int unknownCount = 0;

  void onSwipeLeft() {
    setState(() {
      unknownCount++;
      if (currentIndex < words.length - 1) {
        currentIndex++;
      } else {
        // Restart or finish logic
        currentIndex = 0; // or show a completion message
      }
    });
  }

  void onSwipeRight() {
    setState(() {
      knownCount++;
      if (currentIndex < words.length - 1) {
        currentIndex++;
      } else {
        // Restart or finish logic
        currentIndex = 0; // or show a completion message
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF46A0E5),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Bài 1A : Giới thiệu',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Open settings
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onHorizontalDragEnd: (details) {
                if (details.primaryVelocity! < 0) {
                  onSwipeLeft();
                } else if (details.primaryVelocity! > 0) {
                  onSwipeRight();
                }
              },
              child: FlipCard(
                front: Flashcard(text: words[currentIndex]),
                back: Flashcard(text: meanings[currentIndex]),
              ),
            ),
          ),
          SizedBox(height: 16),
          
          // Progress bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: LinearProgressIndicator(
              value: (currentIndex + 1) / words.length,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF46A0E5)),
            ),
          ),
          SizedBox(height: 16),
          
          // Score indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                backgroundColor: Colors.red,
                child: Text(
                  '$unknownCount',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(
                icon: Icon(Icons.info),
                onPressed: () {
                  // Show additional information if needed
                },
              ),
              CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(
                  '$knownCount',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}

class Flashcard extends StatelessWidget {
  final String text;
  const Flashcard({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}