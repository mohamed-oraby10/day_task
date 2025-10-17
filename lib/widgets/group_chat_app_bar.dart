import 'package:day_task/constants.dart';
import 'package:day_task/model/group_chat_model.dart';
import 'package:day_task/widgets/group_datails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class GroupChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GroupChatAppBar({
    super.key,
    this.icon,
    required this.group,
    required this.userStatus,
  });
  final String? icon;
  final GroupChatModel group;
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
          group.icon == null
              ? CircleAvatar(
                  radius: 20.r,
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.group, size: 28.sp, color: Colors.grey),
                )
              : CircleAvatar(
                  radius: 20.r,
                  backgroundImage: NetworkImage(group.icon!),
                ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return GroupDatails(group: group);
                          },
                        ),
                      );
                    },
                    child: Text(
                      group.name,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14.sp),
                    ),
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
