import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:korastudy_fe/data/post_repository.dart';
import 'package:korastudy_fe/pages/forums/forums_screen.dart';

class PostService {
  final CollectionReference _collection =
      FirebaseFirestore.instance.collection('posts');
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final PostRepository _postRepository = PostRepository();

  Future<DocumentReference?> addPost(String title, String content, int type,
      String uid, BuildContext context) async {
    DateTime now = DateTime.now();
    try {
      DocumentReference docRef = await _collection.add({
        'title': title,
        'content': content,
        'create_at': "${now.year}-${now.month}-${now.day}",
        'uid': uid,
        'type': type,
        'like_num': 0,
        'comment_num': 0,
        'view_num': 0,
      });
      return docRef;
    } catch (e) {
      print('Error adding document: $e');
      return null;
    }
  }

  Future<Map<String, dynamic>?> getPostById(String postId) async {
    return _postRepository.getPostData(postId);
  }

  Future<Map<String, dynamic>?> getPostName(String postId) async {
    return _postRepository.getPostData(postId);
  }

  Future<void> updateLikeCount(String postId, int likeNum) async {
    await _collection.doc(postId).update({'like_num': likeNum});
  }

  Future<void> getLikeCount(String postId, int likeNum) async {
    await _collection.doc(postId).update({'like_num': likeNum});
  }

  Future<void> deletePost(String postId) async {
    await FirebaseFirestore.instance.collection('posts').doc(postId).delete();
  }
}
