import 'package:day_task/constants.dart';
import 'package:day_task/widgets/default_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ChatScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatScreenAppBar({
    super.key,
    required this.name,
    this.image,
    required this.userStatus,
  });
  final String name;
  final String? image;
  final String userStatus;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: SvgPicture.asset(
          "assets/images/arrowleft.svg",
          height: 24.h,
          width: 24.w,
        ),
      ),
      backgroundColor: kBackgroundColor,
      elevation: 0,
      foregroundColor: Colors.white,
      title: Row(
        children: [
          image == null
              ? DefaultImage(name: name)
              : CircleAvatar(
                  radius: 20.r,
                  backgroundImage: NetworkImage(image!),
                ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    name,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  Text(
                    userStatus,
                    style: TextStyle(fontSize: 12.sp, color: kMainColor),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/images/video.svg',
            height: 24.h,
            width: 24.w,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 8.w),
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/images/callcalling.svg',
              height: 24.h,
              width: 24.w,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
