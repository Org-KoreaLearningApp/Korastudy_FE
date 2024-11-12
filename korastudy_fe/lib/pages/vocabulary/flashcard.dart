import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:korastudy_fe/models/vocabulary_model.dart';

class FlashcardPage extends StatefulWidget {
  final List<Vocabulary> vocabularies;

  const FlashcardPage({super.key, required this.vocabularies});

  @override
  _FlashcardPageState createState() => _FlashcardPageState();
}

class _FlashcardPageState extends State<FlashcardPage> {
  int currentIndex = 0;
  int knownCount = 0;
  int unknownCount = 0;

  void onSwipeLeft() {
    setState(() {
      unknownCount++;
      if (currentIndex < widget.vocabularies.length - 1) {
        currentIndex++;
      }
    });
  }

  void onSwipeRight() {
    setState(() {
      knownCount++;
      if (currentIndex < widget.vocabularies.length - 1) {
        currentIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flashcards'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: FlipCard(
                front: Card(
                  color: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        widget.vocabularies[currentIndex].word,
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                back: Card(
                  color: Colors.orangeAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        widget.vocabularies[currentIndex].meaning,
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: onSwipeLeft,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                ),
                child: Text('Unknown'),
              ),
              ElevatedButton(
                onPressed: onSwipeRight,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                ),
                child: Text('Known'),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Known: $knownCount, Unknown: $unknownCount',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
