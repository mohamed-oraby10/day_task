import 'package:day_task/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomSquare extends StatelessWidget {
  const CustomSquare({super.key, required this.icon, this.onPress});
  final String icon;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 41.h,
        width: 41.w,
        decoration: BoxDecoration(color: kMainColor),
        child: Center(
          child: SvgPicture.asset(
            icon,
            width: 24.w,
            height: 24.h,
            fit: BoxFit.contain,
            color: kBackgroundColor,
          ),
        ),
      ),
    );
  }
}
