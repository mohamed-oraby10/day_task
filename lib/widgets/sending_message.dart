import 'package:day_task/constants.dart';
import 'package:day_task/model/message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SendingMeaasge extends StatelessWidget {
  const SendingMeaasge({super.key, required this.message});
  final MessageModel message;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          constraints: BoxConstraints(maxWidth: screenWidth * 0.7),
          padding: EdgeInsetsDirectional.symmetric(horizontal: 5.w),
          color: kMainColor,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  right: 30.w,
                  bottom: 12.h,
                  top: 12.h,
                  left: 12.w,
                ),
                child: Text(
                  message.message,
                  style: TextStyle(
                    color: kBackgroundColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              if (message.isSeen)
                Positioned(
                  right: 0.w,
                  bottom: 0.h,
                  child: Text(
                    'Seen',
                    style: TextStyle(
                      color: kBackgroundColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
