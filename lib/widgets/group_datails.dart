import 'package:day_task/constants.dart';
import 'package:day_task/model/group_chat_model.dart';
import 'package:day_task/widgets/custom_app_bar.dart';
import 'package:day_task/widgets/selected_group_members.dart';
import 'package:flutter/material.dart';

class GroupDatails extends StatelessWidget {
  const GroupDatails({super.key, required this.group});
  final GroupChatModel group;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Group details',
        sufImage: 'assets/images/edit.svg',
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: group.icon != null
                        ? NetworkImage(group.icon!)
                        : null,
                    child: group.icon == null
                        ? CircleAvatar(
                            radius: 70,
                            backgroundColor: Colors.grey[300],
                            child: const Icon(
                              Icons.group,
                              size: 60,
                              color: Colors.grey,
                            ),
                          )
                        : null,
                  ),
                ),
              ),
              Center(
                child: Text(
                  group.name,
                  style: TextStyle(color: kMainColor, fontSize: 22),
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: Text(
                  "${group.groupMembers.length} members",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              Expanded(child: SelectedGroupMembers(group: group)),
            ],
          ),
        ),
      ),
    );
  }
}
