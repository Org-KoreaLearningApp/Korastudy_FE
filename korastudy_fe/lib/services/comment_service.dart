import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:korastudy_fe/data/comment_repository.dart';

class CommentService {
  final CollectionReference _collection =
      FirebaseFirestore.instance.collection('comments');
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CommentRepository _commentRepository = CommentRepository();

  Future<DocumentReference?> addComment(
      String content, String postId, String uid, BuildContext context) async {
    DateTime now = DateTime.now();
    try {
      DocumentReference docRef = await _collection.add({
        'content': content,
        'postId': postId,
        'userId': uid,
        'createdAt': "${now.year}-${now.month}-${now.day}",
        'like_num': 0,
        'not_like_num': 0,
      });
      return docRef;
    } catch (e) {
      print('Error adding document: $e');
      return null;
    }
  }

  Future<void> updateLikeCount(String commentId, int likeNum) async {
    await _collection.doc(commentId).update({'like_num': likeNum});
  }

  Future<void> updateUnLikeCount(String commentId, int unlikeNum) async {
    await _collection.doc(commentId).update({'like_num': unlikeNum});
  }
}
