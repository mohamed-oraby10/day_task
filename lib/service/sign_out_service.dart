//  import 'package:day_task/utilitis/app_routes.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// Future<void> signOut(BuildContext context) async {
//      try {
//       await FirebaseAuth.instance.signOut();
    
//       if (context.mounted) {
//         Navigator.pushReplacementNamed(
//           context,
//           AppRoutes.loginRoute,
//         );
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }







import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:day_task/provider/user_provider.dart';
import 'package:day_task/utilitis/app_routes.dart';

Future<void> signOut(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  
  // نظّف بيانات المستخدم القديم
  Provider.of<UserProvider>(context, listen: false).clearUser();

  // رجّع المستخدم لصفحة تسجيل الدخول
  Navigator.pushNamedAndRemoveUntil(
    context,
    AppRoutes.loginRoute,
    (route) => false,
  );
}
