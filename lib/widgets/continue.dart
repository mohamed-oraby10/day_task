import 'package:day_task/service/google_sign_in_service.dart';
import 'package:day_task/widgets/google_button.dart';
import 'package:day_task/utilitis/app_colors.dart';
import 'package:day_task/utilitis/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Continue extends StatelessWidget {
  final bool isRegisterScreen;
  const Continue({super.key, this.isRegisterScreen = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(height: 1, color: AppColors.labelTextColor),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Or continue with',
                style: TextStyle(color: AppColors.labelTextColor, fontSize: 17),
              ),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Divider(
                  height: 1,
                  thickness: 1,
                  color: AppColors.labelTextColor,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        GoogleButton(),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isRegisterScreen
                  ? 'Already have an account?'
                  : 'Don\'t have an account?',
              style: const TextStyle(
                color: AppColors.labelTextColor,
                fontSize: 17,
              ),
            ),
            TextButton(
              onPressed: () {
                isRegisterScreen
                    ? Navigator.pop(context)
                    : Navigator.pushNamed(context, AppRoutes.registerRoute);
              },
              child: Text(
                isRegisterScreen ? 'Log In' : 'Sign Up',
                style: const TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 17,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
