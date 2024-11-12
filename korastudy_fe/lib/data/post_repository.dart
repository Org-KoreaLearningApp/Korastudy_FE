import 'package:cloud_firestore/cloud_firestore.dart';

class PostRepository {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<Map<String, dynamic>?> getPostData(String id) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('posts').doc(id).get();
      if (doc.exists) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return data;
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
