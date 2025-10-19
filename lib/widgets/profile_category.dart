import 'package:day_task/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProfileCategory extends StatelessWidget {
  const ProfileCategory({
    super.key,
    required this.text,
    required this.preImage,
    required this.postImage,
    this.onPress,
  });
  final String? text;
  final String? preImage;
  final String? postImage;
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Container(
        padding: EdgeInsets.all(4.r),
        color: kFillTextFormColor,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Row(
            children: [
              SvgPicture.asset(preImage ?? ''),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  text ?? '',
                  style: TextStyle(color: Colors.white, fontSize: 18.sp),
                ),
              ),

              IconButton(
                onPressed: onPress,
                icon: SvgPicture.asset(
                  postImage ?? '',
                  color: kLabelTextColor,
                  width: 24.w,
                  height: 24.h,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
