import 'package:day_task/constants.dart';
import 'package:day_task/helper/chat%20methods/get_smart_time_method.dart';
import 'package:day_task/model/chat_model.dart';
import 'package:day_task/model/user_model.dart';
import 'package:day_task/screens/chat_screen.dart';
import 'package:day_task/widgets/default_image.dart';
import 'package:flutter/material.dart';

class ChatPerson extends StatelessWidget {
  const ChatPerson({super.key, required this.chat, required this.user});
  final ChatModel chat;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),

      child: Row(
        children: [
          user.image != null
              ? CircleAvatar(
                  backgroundImage: NetworkImage(user.image!),
                  radius: 22,
                )
              : DefaultImage(name: user.name),
          Expanded(
            child: Material(
              color: kBackgroundColor,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ChatScreen();
                      },
                      settings: RouteSettings(arguments: user),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      SizedBox(height: 5),
                      Text(
                        chat.lastMessage,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Color(0xffB8B8B8),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Text(
            getSmartTime(chat.lastMessageTime),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Color(0xffB8B8B8), fontSize: 12),
          ),
        ],
      ),
    );
  }
}
