import 'package:day_task/constants.dart';
import 'package:day_task/helper/chat%20methods/get_smart_time_method.dart';
import 'package:day_task/model/group_chat_model.dart';
import 'package:day_task/utilitis/app_routes.dart';
import 'package:flutter/material.dart';

class MessageCategory extends StatelessWidget {
  const MessageCategory({super.key, required this.group});
  final GroupChatModel group;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      child: Row(
        children: [
          group.icon != null
              ? Image.network(group.icon!)
              : CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.grey[300],
                  child: const Icon(Icons.group, size: 30, color: Colors.grey),
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
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        group.name,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        group.lastMessage ?? '',
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
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
            style: TextStyle(color: Color(0xffB8B8B8), fontSize: 12),
          ),
        ],
      ),
    );
  }
}
