import 'package:day_task/utilitis/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> navigateAfterDelay(BuildContext context) async {
  await Future.delayed(const Duration(seconds: 2));

  if (!context.mounted) return;

  final user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.homeRoute,
      (route) => false,
    );
  } else {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.loginRoute,
      (route) => false,
    );
  }
}
