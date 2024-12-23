import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String _userId = "";
  String get userId => _userId;

  void setUserId(String id) {
    _userId = id;
    notifyListeners();
  }

  Future<void> fetchUserId() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      _userId = user.uid;
      notifyListeners();
    }
  }

  void clearUserId() {
    _userId = "";
    notifyListeners();
  }
}
