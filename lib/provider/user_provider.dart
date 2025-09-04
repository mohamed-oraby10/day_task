import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String? name, email, image;

  UserProvider() {
    loadUser();
  }

  Future<void> loadUser() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (doc.exists) {
        name = doc['name'];
        email = doc['email'];
        image = doc['image'];
      } else {
        name = user.displayName;
        email = user.email;
        image = user.photoURL;
      }
    }
    notifyListeners();
  }

  
Future<void> saveUserData(String name,{String? image}) async {
  final user = FirebaseAuth.instance.currentUser;

  if(user == null) return;

  final data = {
   'name': name,
    'email': user.email,
    'image': image,
  };

  await FirebaseFirestore.instance.collection("users").doc(user.uid).set(data,SetOptions(merge: true));

  this.email = email;
  this.image=image;
  this.name = name;
  notifyListeners();
}
}


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class UserProvider extends ChangeNotifier {
//   String? name, email, image;

//   UserProvider() {
//     loadUser();
//   }

//   Future<void> loadUser() async {
//     final user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       final doc = await FirebaseFirestore.instance
//           .collection('users')
//           .doc(user.uid)
//           .get();

//       if (doc.exists) {
//         name = doc['name'];
//         email = doc['email'];
//         image = doc['image'];
//       } else {
//         name = user.displayName;
//         email = user.email;
//         image = user.photoURL;
//       }
//       notifyListeners();
//     }
//   }

//   Future<void> saveUserData(String name, {String? image}) async {
//     final user = FirebaseAuth.instance.currentUser;
//     if (user == null) return;

//     final data = {
//       'name': name,
//       'email': user.email,
//       'image': image,
//     };

//     await FirebaseFirestore.instance
//         .collection("users")
//         .doc(user.uid)
//         .set(data, SetOptions(merge: true));

//     this.name = name;
//     this.email = user.email;
//     this.image = image ?? user.photoURL;

//     notifyListeners();
//   }
// }
