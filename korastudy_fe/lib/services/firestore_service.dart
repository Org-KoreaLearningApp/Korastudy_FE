// lib/services/firestore_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:korastudy_fe/models/vocabulary_model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addVocabularySet(VocabularySet vocabularySet) async {
    await _db.collection('vocabulary_sets').add(vocabularySet.toMap());
  }

  Future<void> addVocabulary(String setId, Vocabulary vocabulary) async {
    await _db.collection('vocabulary_sets').doc(setId).collection('vocabularies').add(vocabulary.toMap());
  }

  Future<List<VocabularySet>> getVocabularySets() async {
    final snapshot = await _db.collection('vocabulary_sets').get();
    return snapshot.docs.map((doc) => VocabularySet.fromMap(doc.data(), doc.id)).toList();
  }

  Future<List<Vocabulary>> getVocabularies(String setId) async {
    final snapshot = await _db.collection('vocabulary_sets').doc(setId).collection('vocabularies').get();
    return snapshot.docs.map((doc) => Vocabulary.fromMap(doc.data(), doc.id)).toList();
  }
}