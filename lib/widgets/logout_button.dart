import 'package:day_task/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key, this.onPress});
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40.h),
      child: SizedBox(
        width: double.infinity,
        height: 54.h,
        child: ElevatedButton(
          onPressed: onPress,
          style: ElevatedButton.styleFrom(
            backgroundColor: kMainColor,
            foregroundColor: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/logoutcurve.svg",
                width: 24.w,
                height: 24.h,
              ),
              SizedBox(width: 10.w),
              Text(
                style: TextStyle(fontSize: 18.sp, color: kBackgroundColor),
                "Logout",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
