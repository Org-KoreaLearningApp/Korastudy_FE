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
  List<Vocabulary> words = [];
  int currentIndex = 0;
  int knownCount = 0;
  int unknownCount = 0;

  @override
  void initState() {
    super.initState();
    _fetchVocabularySets();
  }

  void _fetchVocabularySets() async {
    List<VocabularySet> sets = await _firestoreService.getVocabularySets();
    if (sets.isNotEmpty) {
      List<Vocabulary> vocabularies = await _firestoreService.getVocabularies(sets[0].id);
      setState(() {
        words = vocabularies;
      });
    }
  }

  void onSwipeLeft() {
    setState(() {
      unknownCount++;
      if (currentIndex < words.length - 1) {
        currentIndex++;
      } else {
        currentIndex = 0; // Loop back to the first word
      }
    });
  }

  void onSwipeRight() {
    setState(() {
      knownCount++;
      if (currentIndex < words.length - 1) {
        currentIndex++;
      } else {
        currentIndex = 0; // Loop back to the first word
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flashcards'),
      ),
      body: words.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Column(
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
                              words[currentIndex].word,
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
                              words[currentIndex].meaning,
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
                      child: Text('Unknown', style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
                    ),
                    ElevatedButton(
                      onPressed: onSwipeRight,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent,
                      ),
                      child: Text('Known', style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Known: $knownCount, Unknown: $unknownCount',
                    style: TextStyle(fontSize: 16,color: const Color.fromARGB(255, 0, 0, 0)),
                    
                  ),
                ),
              ],
            ),
    );
  }
}