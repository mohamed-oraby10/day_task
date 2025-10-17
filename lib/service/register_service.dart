 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> registerUser({required String? email,required String name,required String? password}) async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);

    await user.user!.updateDisplayName(name);
    await user.user!.updatePhotoURL(null);

    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.user!.uid)
        .set({
          'name': name,
          'email': email,
          'photo': null,
        }, SetOptions(merge: true));
  }