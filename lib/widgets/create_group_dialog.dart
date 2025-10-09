import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_task/constants.dart';
import 'package:day_task/model/team_member_model.dart';
import 'package:day_task/widgets/selected_team_members_list.dart';
import 'package:day_task/widgets/text_input.dart';
import 'package:flutter/material.dart';

class CreateGroupDialog extends StatelessWidget {
  const CreateGroupDialog({super.key});

  @override
  Widget build(BuildContext context) {
    List<TeamMemberModel> selectedMembers = [];

    return AlertDialog(
      title: Center(
        child: Text(
          'Create a group',
          style: TextStyle(color: kMainColor, fontSize: 17),
        ),
      ),
      backgroundColor: kSecondColor,
      content: SizedBox(
        width: double.maxFinite,
        height: 350,
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            final users = snapshot.data!.docs;

            if (users.isEmpty) {
              return const Center(
                child: Text(
                  "No users found",
                  style: TextStyle(color: Colors.white),
                ),
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Group name',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: TextInput(hint: 'Group name'),
                ),
                Text(
                  'Group members',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
                Expanded(
                  child: SelectedTeamMembersList(
                    users: users,
                    selectedMembers: selectedMembers,
                  ),
                ),
              ],
            );
          },
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cencel',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            SizedBox(width: 5),
            TextButton(
              onPressed: () {},
              child: Text(
                'Create',
                style: TextStyle(color: kMainColor, fontSize: 16),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
