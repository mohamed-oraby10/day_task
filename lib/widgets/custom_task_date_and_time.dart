import 'package:day_task/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTaskDateAndTime extends StatelessWidget {
  const CustomTaskDateAndTime({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41.h,
      width: 135.w,
      color: kFillTextFormColor,
      child: Center(
        child: Text(text, style: TextStyle(color: Colors.white, fontSize: 18.sp)),
      ),
    );
  }
}
