import 'package:day_task/constants.dart';
import 'package:day_task/model/message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecievedMessage extends StatelessWidget {
  const RecievedMessage({super.key, required this.message});
  final MessageModel message;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          constraints: BoxConstraints(maxWidth: screenWidth * 0.7),
          padding: EdgeInsetsDirectional.symmetric(
            vertical: 12.h,
            horizontal: 12.w,
          ),
          color: kSecondColor,
          child: Text(
            message.message,
            style:  TextStyle(color: Colors.white, fontSize: 16.sp),
          ),
        ),
      ),
    );
  }
}
