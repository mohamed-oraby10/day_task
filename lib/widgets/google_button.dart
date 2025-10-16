import 'package:day_task/constants.dart';
import 'package:day_task/helper/snak_bar.dart';
import 'package:day_task/service/signin_with_google_service.dart';
import 'package:day_task/utilitis/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoogleButton extends StatefulWidget {
  const GoogleButton({super.key});
  @override
  State<GoogleButton> createState() => _GoogleButtonState();
}

class _GoogleButtonState extends State<GoogleButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 67.h,
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
          backgroundColor: kBackgroundColor,
          foregroundColor: Colors.white,
          side: BorderSide(color: Colors.white, width: 2.w),
        ),
        child: isLoading
            ? SizedBox(
                height: 25.h,
                width: 25.w,
                child: CircularProgressIndicator(
                  strokeWidth: 2.w,
                  color: kMainColor,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/images/google.svg"),
                  SizedBox(width: 10.w),
                  Text("Google", style: TextStyle(fontSize: 18.sp)),
                ],
              ),
      ),
    );
  }
}
