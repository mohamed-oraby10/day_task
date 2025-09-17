 import 'package:day_task/utilitis/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> signOut(BuildContext context) async {
     try {
      await FirebaseAuth.instance.signOut();
    
      if (context.mounted) {
        Navigator.pushReplacementNamed(
          context,
          AppRoutes.loginRoute,
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }