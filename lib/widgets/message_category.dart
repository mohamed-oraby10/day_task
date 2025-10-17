import 'package:day_task/constants.dart';
import 'package:day_task/helper/chat%20methods/get_smart_time_method.dart';
import 'package:day_task/model/group_chat_model.dart';
import 'package:day_task/utilitis/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageCategory extends StatelessWidget {
  const MessageCategory({super.key, required this.group});
  final GroupChatModel group;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 30.w),
      child: Row(
        children: [
          group.icon != null
              ? Image.network(group.icon!)
              : CircleAvatar(
                  radius: 22.r,
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.group, size: 30.sp, color: Colors.grey),
                ),
          Expanded(
            child: Material(
              color: kBackgroundColor,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.chatGroupRoute,
                    arguments: group,
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        group.name,
                        style: TextStyle(fontSize: 16.sp, color: Colors.white),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        "${group.lastMessageSenderName}: ${group.lastMessage}",
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Color(0xffB8B8B8),
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Text(
            getSmartTime(group.lastMessageTime),
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Color(0xffB8B8B8), fontSize: 12.sp),
          ),
        ],
      ),
    );
  }
}
