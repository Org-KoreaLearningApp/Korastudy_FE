// lib/services/firestore_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:korastudy_fe/models/grammar_model.dart';
import 'package:korastudy_fe/models/vocabulary_model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<VocabularySet>> getVocabularySets() async {
    final snapshot = await _db.collection('vocabulary_sets').get();
    return snapshot.docs
        .map((doc) => VocabularySet.fromMap(doc.data(), doc.id))
        .toList();
  }

  Future<List<Vocabulary>> getVocabularies(String setId) async {
    final snapshot = await _db
        .collection('vocabulary_sets')
        .doc(setId)
        .collection('vocabularies')
        .get();
    final vocabularies = snapshot.docs
        .map((doc) => Vocabulary.fromMap(doc.data(), doc.id))
        .toList();
    for (var vocab in vocabularies) {
      print('Vocabulary: ${vocab.word}, Audio URL: ${vocab.audioUrl}');
    }
    return vocabularies;
  }

  Future<List<GrammarSet>> getGrammarSets() async {
    final snapshot = await _db.collection('grammar_sets').get();
    return snapshot.docs
        .map((doc) => GrammarSet.fromMap(doc.data(), doc.id))
        .toList();
  }

  Future<List<Grammar>> getGrammars(String setId) async {
    final snapshot = await _db
        .collection('grammar_sets')
        .doc(setId)
        .collection('grammars')
        .get();
    return snapshot.docs
        .map((doc) => Grammar.fromMap(doc.data(), doc.id))
        .toList();
  }
}
