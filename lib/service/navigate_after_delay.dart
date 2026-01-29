// import 'package:day_task/utilitis/app_routes.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// Future<void> navigateAfterDelay(BuildContext context) async {
 
//     final user = FirebaseAuth.instance.currentUser;
//     if (!context.mounted) return;

//     if (user != null) {
//       Navigator.pushNamedAndRemoveUntil(context, AppRoutes.homeRoute, (route) => false);
//     } else {
//          await Future.delayed(const Duration(seconds: 2));
//       Navigator.pushNamedAndRemoveUntil(context, AppRoutes.loginRoute, (route) => false);
//     }
// }