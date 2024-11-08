import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:korastudy_fe/models/vocabulary_model.dart';
import 'package:korastudy_fe/services/firestore_service.dart';

class FlashcardPage extends StatefulWidget {
  @override
  _FlashcardPageState createState() => _FlashcardPageState();
}

class _FlashcardPageState extends State<FlashcardPage> {
  final FirestoreService _firestoreService = FirestoreService();
  late Future<List<VocabularySet>> _vocabularySets;
  String? _selectedSetId;
  List<Vocabulary> _vocabularies = [];

  List<String> get words => _vocabularies.map((v) => v.word).toList();
  List<String> get meanings => _vocabularies.map((v) => v.meaning).toList();
  int currentIndex = 0;
  int knownCount = 0;
  int unknownCount = 0;
  @override
  void initState() {
    super.initState();
    _vocabularySets = _firestoreService.getVocabularySets();
  }

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

  void _onSetSelected(String? setId) async {
    if (setId != null) {
      List<Vocabulary> vocabularies =
          await _firestoreService.getVocabularies(setId);
      setState(() {
        _selectedSetId = setId;
        _vocabularies = vocabularies;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flashcards'),
      ),
      body: FutureBuilder<List<VocabularySet>>(
        future: _vocabularySets,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No vocabulary sets available.'));
          } else {
            return _buildFlashcardContent();
          }
        },
      ),
    );
  }

  Widget _buildFlashcardContent() {
    if (_vocabularies.isEmpty) {
      return Center(child: Text('No vocabularies available.'));
    }

    return Column(
      children: [
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
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            IconButton(
              icon: Icon(Icons.info),
              onPressed: () {
                // Show additional information if needed
              },
            ),
            CircleAvatar(
              backgroundColor: Colors.green,
              child: Text(
                '$knownCount',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        // Flashcard display
        Expanded(
          child: Center(
            child: Flashcard(
              text: words[currentIndex],
              onTap: () {
                // Handle flashcard tap
              },
            ),
          ),
        ),
      ],
    );
  }
}

class Flashcard extends StatelessWidget {
  final String text;
  const Flashcard({required this.text, required Null Function() onTap});

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
