import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScheduleCategory extends StatelessWidget {
  const ScheduleCategory({
    super.key,
    required this.color,
    required this.number,
    required this.day,
    this.onTap,
    required this.dayNameColor,
    required this.dayNumberColor,
  });
  final Color color;
  final String number;
  final String day;
  final void Function()? onTap;
  final Color dayNumberColor;
  final Color dayNameColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12.w),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height: 70.h,
          width: 45.w,
          color: color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                number,
                style: TextStyle(
                  color: dayNumberColor,
                  fontSize: 19.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                day,
                style: TextStyle(color: dayNumberColor, fontSize: 10.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
