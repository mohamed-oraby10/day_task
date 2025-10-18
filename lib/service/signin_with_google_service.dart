import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<UserCredential> signWithGoogle() async {
  final GoogleSignIn googleSignIn = GoogleSignIn();
     await googleSignIn.signOut();
  final googleUser = await googleSignIn.signIn();

  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  final credential = GoogleAuthProvider.credential(
    idToken: googleAuth?.idToken,
    accessToken: googleAuth?.accessToken,
  );

  UserCredential user = await FirebaseAuth.instance.signInWithCredential(
    credential,
  );

  await FirebaseFirestore.instance.collection('users').doc(user.user!.uid).set({
    'name': user.user?.displayName,
    'email': user.user?.email,
    'photo': user.user?.photoURL,
  }, SetOptions(merge: true));

  return user;
}
