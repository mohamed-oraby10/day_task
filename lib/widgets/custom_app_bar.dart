import 'package:day_task/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.sufImage,
    this.onPress,
  });
  final String title;
  final String? sufImage;
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: SvgPicture.asset(
          "assets/images/arrowleft.svg",
          width: 24.w,
          height: 24.h,
        ),
      ),
      backgroundColor: kBackgroundColor,
      elevation: 0,
      foregroundColor: Colors.white,
      title: Center(
        child: Text(title, style: TextStyle(fontSize: 20.sp)),
      ),
      actions: [
        if (sufImage != null)
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: IconButton(
              onPressed: onPress,
              icon: SvgPicture.asset(sufImage!, width: 24.w, height: 24.h),
            ),
          ),
        if (sufImage == null) SizedBox(width: 56.w),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
