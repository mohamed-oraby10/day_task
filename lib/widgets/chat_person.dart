import 'package:day_task/constants.dart';
import 'package:day_task/helper/chat%20methods/get_smart_time_method.dart';
import 'package:day_task/model/chat_model.dart';
import 'package:day_task/model/user_model.dart';
import 'package:day_task/utilitis/app_routes.dart';
import 'package:day_task/widgets/default_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatPerson extends StatelessWidget {
  const ChatPerson({super.key, required this.chat, required this.user});
  final ChatModel chat;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final currentUserId = FirebaseAuth.instance.currentUser!.uid;
    final isReceivedMessage = chat.lastMessageSenderId != currentUserId;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 30.w),

      child: Row(
        children: [
          user.image != null
              ? CircleAvatar(
                  backgroundImage: NetworkImage(user.image!),
                  radius: 22.r,
                )
              : DefaultImage(name: user.name),
          Expanded(
            child: Material(
              color: kBackgroundColor,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.chatingRoute,
                    arguments: user,
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name,
                        style: TextStyle(fontSize: 16.sp, color: Colors.white),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        chat.lastMessage,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: chat.lastMessageSeen
                              ? Color(0xffB8B8B8)
                              : Colors.white,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              Text(
                getSmartTime(chat.lastMessageTime),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Color(0xffB8B8B8), fontSize: 12.sp),
              ),
              SizedBox(height: 4.h),
              if (isReceivedMessage && !chat.lastMessageSeen)
                Container(
                  width: 8.w,
                  height: 8.h,
                  decoration: const BoxDecoration(
                    color: kMainColor,
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
