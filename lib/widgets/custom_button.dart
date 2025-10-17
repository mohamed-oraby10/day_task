import 'package:day_task/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onPress,
    required this.isMessage,
  });
  final String text;
  final void Function()? onPress;
  final bool isMessage;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 47.h,
        width: 175.w,
        decoration: BoxDecoration(color: isMessage ? kMainColor : kSecondColor),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isMessage ? Colors.black : Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
