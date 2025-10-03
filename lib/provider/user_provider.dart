import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../model/user_model.dart';

class UserProvider extends ChangeNotifier {
  UserModel? userModel;
  Stream<DocumentSnapshot>? userStream;

  UserProvider() {
    listenToUser();
  }

  void listenToUser() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userStream = FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .snapshots();

      userStream!.listen((doc) {
        if (doc.exists) {
          final data = doc.data() as Map<String, dynamic>;
          userModel = UserModel.fromJson(user.uid, data);
        } else {
          userModel = UserModel(
            uid: user.uid,
            name: user.displayName ?? "",
            email: user.email ?? "",
            image: user.photoURL,
          );
        }
        notifyListeners();
      });
    }
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
