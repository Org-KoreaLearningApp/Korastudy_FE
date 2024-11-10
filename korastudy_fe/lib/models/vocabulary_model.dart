// lib/models/vocabulary_model.dart
class Vocabulary {
  final String id;
  final String word;
  final String meaning;
  final String audioUrl; // This should match the field name in Firestore

  Vocabulary({required this.id, required this.word, required this.meaning, required this.audioUrl});

  factory Vocabulary.fromMap(Map<String, dynamic> data, String documentId) {
    return Vocabulary(
      id: documentId,
      word: data['word'] ?? '',
      meaning: data['meaning'] ?? '',
      audioUrl: data['url'] ?? '', // Change this to match the Firestore field name
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'word': word,
      'meaning': meaning,
      'url': audioUrl, // Ensure this matches the Firestore field name
    };
  }
}
class VocabularySet {
  final String id;
  final String name;

  VocabularySet({required this.id, required this.name});

  factory VocabularySet.fromMap(Map<String, dynamic> data, String documentId) {
    return VocabularySet(
      id: documentId,
      name: data['name'] ?? 'Unknown Set', // Provide a default value if 'name' is null
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name, // Ensure this matches the Firestore field name
    };
  }
}