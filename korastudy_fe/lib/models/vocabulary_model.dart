// lib/models/vocabulary_model.dart
class Vocabulary {
  final String id;
  final String word;
  final String meaning;

  Vocabulary({required this.id, required this.word, required this.meaning});

  factory Vocabulary.fromMap(Map<String, dynamic> data, String documentId) {
    return Vocabulary(
      id: documentId,
      word: data['word'] ?? '',
      meaning: data['meaning'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'word': word,
      'meaning': meaning,
    };
  }
}

class VocabularySet {
  final String id;
  final String title;

  VocabularySet({required this.id, required this.title});

  factory VocabularySet.fromMap(Map<String, dynamic> data, String documentId) {
    return VocabularySet(
      id: documentId,
      title: data['title'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
    };
  }
}