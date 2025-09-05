import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String? name, email, image;
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

          name = data['name'] ?? user.displayName;
          email = data['email'] ?? user.email;
          image = data['image'] ?? user.photoURL;
        } else {
          name = user.displayName;
          email = user.email;
          image = user.photoURL;
        }

        notifyListeners();
      });
    }
  }

  Future<void> saveUserData(String name, {String? image}) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final data = {'name': name, 'email': user.email, 'image': image};

    await FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .set(data, SetOptions(merge: true));
  }
}
