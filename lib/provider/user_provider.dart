import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../model/user_model.dart';

class UserProvider extends ChangeNotifier {
  UserModel? userModel;
  StreamSubscription<DocumentSnapshot>? _userSub;
  StreamSubscription<User?>? _authSub;

  UserProvider() {
    _authSub = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        listenToUser(user.uid);
      } else {
        clearUser();
      }
    });
  }
  Future<void> listenToUser(String uid) async {
    _userSub?.cancel();
    _userSub = FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .snapshots()
        .listen((doc) {
          if (doc.exists) {
            final data = doc.data() as Map<String, dynamic>;
            userModel = UserModel.fromJson(uid, data);
          } else {
            final user = FirebaseAuth.instance.currentUser;
            userModel = UserModel(
              uid: user?.uid ?? "",
              name: user?.displayName ?? "",
              email: user?.email ?? "",
              image: user?.photoURL,
            );
          }
          notifyListeners();
        });
  }

  void clearUser() {
    userModel = null;
    _userSub?.cancel();
    notifyListeners();
  }

  @override
  void dispose() {
    _userSub?.cancel();
    _authSub?.cancel();
    super.dispose();
  }

  Future<void> saveUserData(String name, {String? image}) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final data = {'name': name, 'email': user.email, 'photo': image};

    await FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .set(data, SetOptions(merge: true));
  }
}
