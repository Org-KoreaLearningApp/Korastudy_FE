import 'package:cloud_firestore/cloud_firestore.dart';

class CommentRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Future<Map<String, dynamic>?> getCommentData(String postId) async {
  //   try {
  //     QuerySnapshot snapshot = await _firestore
  //         .collection('comments')
  //         .where('postId', isEqualTo: postId)
  //         .orderBy('create_at', descending: true)
  //         .get();
  //     Map<String, dynamic> comments = snapshot.docs.map((doc) {
  //       return {
  //         'commentId': doc.id,
  //         'content': doc['comment'],
  //         'postId': doc['post_id'],
  //         'userId': doc['userId'],
  //         'createdAt': doc['created_at'],
  //         'like_num': doc['like_num'],
  //         'not_like_num': doc['not_like_num'],
  //       };
  //     }).;
  //     return comments;
  //   } catch (e) {
  //     print(e);
  //     return null;
  //   }
  // }
}
