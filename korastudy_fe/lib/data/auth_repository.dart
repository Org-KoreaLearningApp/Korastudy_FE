import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:korastudy_fe/models/user_model.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> login(String email, String pass) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );
      return userCredential.user;
    } catch (e) {
      print(e);
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<Map<String, dynamic>?> getUserData(String id) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('users').doc(id).get();
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

  Future<String?> getNameById(String id) async {
    try {
      Map<String, dynamic>? userInfo = await getUserData(id);
      return userInfo?['name'] ?? "No name";
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<String?> getImageById(String id) async {
    try {
      Map<String, dynamic>? userInfo = await getUserData(id);
      return userInfo?['image'] ??
          'https://drive.google.com/file/d/1MJo1yoE4mUXqBwp8zFuLDLLhrAHwmvEE/view?usp=drive_link';
    } catch (e) {
      print(e);
      return null;
    }
  }
}
