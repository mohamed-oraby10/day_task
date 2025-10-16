import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text, required this.textColor});
  final String text;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "PilatExtended",
        fontSize: 61.sp,
        height: 1,
        color: textColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
