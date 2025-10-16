import 'package:day_task/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSizedBox extends StatelessWidget {
  const CustomSizedBox({super.key, required this.messageText});
  final String messageText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: Center(
        child: Text(
          messageText,
          style: TextStyle(color: kMainColor, fontSize: 16.sp),
        ),
      ),
    );
  }
}
