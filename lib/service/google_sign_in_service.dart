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

  return await FirebaseAuth.instance.signInWithCredential(credential);
}
