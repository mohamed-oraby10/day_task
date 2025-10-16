import 'package:day_task/constants.dart';
import 'package:day_task/widgets/google_button.dart';
import 'package:day_task/utilitis/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Continue extends StatelessWidget {
  final bool isRegisterScreen;
  const Continue({super.key, this.isRegisterScreen = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 35.h),
          child: Row(
            children: [
              Expanded(
                child: Container(height: 1.h, color: kLabelTextColor),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  'Or continue with',
                  style: TextStyle(color: kLabelTextColor, fontSize: 16.sp),
                ),
              ),
              Expanded(
                child: Divider(height: 1, thickness: 1, color: kLabelTextColor),
              ),
            ],
          ),
        ),
        GoogleButton(),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isRegisterScreen
                  ? 'Already have an account?'
                  : 'Don\'t have an account?',
              style: TextStyle(color: kLabelTextColor, fontSize: 16.sp),
            ),
            TextButton(
              onPressed: () {
                isRegisterScreen
                    ? Navigator.pop(context)
                    : Navigator.pushNamed(context, AppRoutes.registerRoute);
              },
              child: Text(
                isRegisterScreen ? 'Log In' : 'Sign Up',
                style: TextStyle(color: kMainColor, fontSize: 16.sp),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
