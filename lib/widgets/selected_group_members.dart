import 'package:day_task/model/group_chat_model.dart';
import 'package:day_task/widgets/default_image.dart';
import 'package:flutter/material.dart';

class SelectedGroupMembers extends StatelessWidget {
  const SelectedGroupMembers({super.key, required this.group});
  final GroupChatModel group;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: group.groupMembers.length,
      itemBuilder: (context, index) {
        final member = group.groupMembers[index];

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: GestureDetector(
            child: ListTile(
              leading: member['photo'] == null
                  ? DefaultImage(name: member['name'])
                  : CircleAvatar(
                      radius: 22,
                      backgroundImage: NetworkImage(member['photo']!),
                    ),
              title: Text(
                member['name'],
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }
}
