import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:korastudy_fe/data/auth_repository.dart';

class AuthService {
  final AuthRepository _authRepository = AuthRepository();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _collection =
      FirebaseFirestore.instance.collection('users');

  Future<User?> login(String email, String password) async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<User?> loginByGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        return userCredential.user;
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }

  Future<String> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return 'Email thiết lập mật khẩu đã được gửi đi. Vui lòng kiểm tra hộp thư của bạn.';
    } catch (e) {
      return 'Error: ${e.toString()}';
    }
  }

  Future<Map<String, dynamic>?> getUserData(String id) async {
    return await _authRepository.getUserData(id);
  }

  Future<Map<String, String?>> getNameAndImage(String uid) async {
    String? name = await _authRepository.getNameById(uid);
    String? image = await _authRepository.getImageById(uid);
    return {'image': image, 'name': name};
  }

  Future<void> updateInfo(
      String uid, String field, String content, BuildContext context) async {
    try {
      // Tìm kiếm document của người dùng theo email
      QuerySnapshot snapshot = await _firestore
          .collection('users')
          .where('id', isEqualTo: uid)
          .get();

      if (snapshot.docs.isNotEmpty) {
        // Lấy ID của document đầu tiên (giả sử mỗi email là duy nhất)
        String docId = snapshot.docs.first.id;

        // Cập nhật trường 'birthday' cho document này
        await _firestore.collection('users').doc(docId).update({
          field: content,
        });
        print('Birthday updated successfully!');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Cập nhật thông tin thành công')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Cập nhật thông tin thất bại.')),
        );
        print('No user found with that email.');
      }
    } catch (e) {
      print('Failed to update birthday: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Cập nhật thông tin thất bại.')),
      );
    }
  }
}
