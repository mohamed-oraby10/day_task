import 'package:day_task/helper/snak_bar.dart';
import 'package:day_task/service/google_sign_in_service.dart';
import 'package:day_task/utilitis/app_colors.dart';
import 'package:day_task/utilitis/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoogleButton extends StatefulWidget {
  const GoogleButton({super.key});
  // final void Function()? onPress;

  @override
  State<GoogleButton> createState() => _GoogleButtonState();
}

class _GoogleButtonState extends State<GoogleButton> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: isLoading
            ? null
            : () async {
                setState(() {
                  isLoading = true;
                });
                try {
                  await signWithGoogle();
                  if (context.mounted) {
                    Navigator.pushNamed(context, AppRoutes.homeRoute);
                    showSnakBar(context, "You login successfully");
                  }
                } catch (e) {
                  if (context.mounted) {
                    showSnakBar(context, "Login failed");
                  }
                }

                setState(() {
                  isLoading = false;
                });
              },

        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.backgroundColor,
          foregroundColor: Colors.white,
          side: const BorderSide(color: Colors.white, width: 2),
        ),
        child: isLoading
            ? SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.mainColor,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/images/google.svg"),
                  SizedBox(width: 10),
                  Text(style: TextStyle(fontSize: 18), "Google"),
                ],
              ),
      ),
    );
  }
}


