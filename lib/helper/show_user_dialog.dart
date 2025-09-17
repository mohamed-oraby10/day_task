import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_task/constants.dart';
import 'package:day_task/model/team_member_model.dart';
import 'package:day_task/widgets/default_image.dart';
import 'package:flutter/material.dart';

Future<void> showUsersDialog(
  BuildContext context,
  Function(List<TeamMemberModel>) onSelect,
) async {
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
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .snapshots(),
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

                  return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final data = users[index].data() as Map<String, dynamic>;
                      final name = data['name'] ?? "Unknown";
                      final image = data['photo'];
                      final member = TeamMemberModel(
                        name: name,
                        image: (image != null && image.isNotEmpty)
                            ? image
                            : null,
                      );

                      final isSelected = selectedMembers.any(
                        (m) => m.name == member.name,
                      );

                      return CheckboxListTile(
                        value: isSelected,
                        activeColor: kMainColor,
                        checkColor: kBackgroundColor,
                        title: Text(
                          name,
                          style: const TextStyle(color: Colors.white),
                        ),
                        secondary: CircleAvatar(
                          backgroundColor: kMainColor,
                          backgroundImage: (image != null && image.isNotEmpty)
                              ? NetworkImage(image)
                              : null,
                          child: (image == null || image.isEmpty)
                              ? DefaultImage(name: name)
                              : null,
                        ),
                        onChanged: (bool? checked) {
                          setState(() {
                            if (checked == true) {
                              selectedMembers.add(member);
                            } else {
                              selectedMembers.removeWhere(
                                (m) => m.name == member.name,
                              );
                            }
                          });
                        },
                      );
                    },
                  );
                },
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
