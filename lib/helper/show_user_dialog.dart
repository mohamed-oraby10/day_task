import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_task/constants.dart';
import 'package:day_task/model/team_member_model.dart';
import 'package:day_task/widgets/selected_team_members_list.dart';
import 'package:flutter/material.dart';

Future<void> showUsersDialog(
  BuildContext context,
  Function(List<TeamMemberModel>) onSelect, {
  List<TeamMemberModel>? projectTeam,
}) async {
  List<TeamMemberModel> selectedMembers = [];

  await showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            backgroundColor: kBackgroundColor,
            title: const Text(
              "Select members",
              style: TextStyle(color: Colors.white),
            ),
            content: SizedBox(
              width: double.maxFinite,
              height: 300,
              child: projectTeam == null
                  ? StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('users')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
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

                        return SelectedTeamMembersList(
                          users: users,
                          selectedMembers: selectedMembers,
                        );
                      },
                    )
                  : SelectedTeamMembersList(
                      projectTeam: projectTeam,
                      selectedMembers: selectedMembers,
                    ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: kMainColor),
                onPressed: () {
                  onSelect(selectedMembers);
                  Navigator.pop(context);
                },
                child: const Text(
                  "Done",
                  style: TextStyle(color: kBackgroundColor),
                ),
              ),
            ],
          );
        },
      );
    },
  );
}
