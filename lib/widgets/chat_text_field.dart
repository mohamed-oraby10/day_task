import 'package:day_task/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatTextField extends StatelessWidget {
  const ChatTextField({super.key, this.onSubmitted, required this.controller});
  final void Function(String)? onSubmitted;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 57.h,
      width: 320.w,
      child: TextField(
        textInputAction: TextInputAction.send,
        controller: controller,
        onSubmitted: (value) {
          if (value.trim().isNotEmpty) {
            onSubmitted?.call(value);
            controller.clear();
          }
        },
        style: TextStyle(color: Colors.white),
        maxLines: 3,
        decoration: InputDecoration(
          hintText: "Type a message",
          hintStyle: TextStyle(color: kLabelTextColor, fontSize: 16.sp),

          prefixIcon: PopupMenuButton<String>(
            icon: SvgPicture.asset(
              "assets/images/elementequal.svg",
              height: 24.h,
              width: 24.w,
            ),
            color: kSecondColor,
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'image',
                child: ListTile(
                  title: Text(
                    "Photos & videos",
                    style: TextStyle(color: Colors.white, fontSize: 18.sp),
                  ),
                  leading: Icon(FontAwesomeIcons.image, color: kMainColor),
                ),
              ),
              PopupMenuItem(
                value: 'data',
                child: ListTile(
                  title: Text(
                    "Document",
                    style: TextStyle(color: Colors.white, fontSize: 18.sp),
                  ),
                  leading: Icon(FontAwesomeIcons.file, color: kMainColor),
                ),
              ),
            ],
          ),

          suffixIcon: IconButton(
            onPressed: () {
              final text = controller.text.trim();
              if (text.isNotEmpty) {
                onSubmitted?.call(text);
                controller.clear();
              }
            },
            icon: SvgPicture.asset(
              "assets/images/send.svg",
              height: 24.h,
              width: 24.w,
            ),
          ),

          fillColor: kSecondColor,
          filled: true,
        ),
      ),
    );
  }
}
