import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:day_task/provider/user_provider.dart';
import 'package:day_task/utilitis/app_routes.dart';

Future<void> signOut(BuildContext context) async {
  await FirebaseAuth.instance.signOut();

  Provider.of<UserProvider>(context, listen: false).clearUser();

  Navigator.pushNamedAndRemoveUntil(
    context,
    AppRoutes.loginRoute,
    (route) => false,
  );
}
