import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_task/constants.dart';
import 'package:day_task/model/team_member_model.dart';
import 'package:day_task/widgets/default_image.dart';
import 'package:flutter/material.dart';

Future<void> showUsersDialog(
  BuildContext context,
  Function(TeamMemberModel) onSelect,
) async {
  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: kBackgroundColor,
        title: const Text(
          "Select a user",
          style: TextStyle(color: Colors.white),
        ),
        content: SizedBox(
          width: double.maxFinite,
          height: 300,
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

              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final data = users[index].data() as Map<String, dynamic>;
                  final name = data['name'] ?? "Unknown";
                  // final email = data['email'] ?? "";
                  final image = data['photo'] ;

                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: kMainColor,
                      backgroundImage: (image != null && image.isNotEmpty)
                          ? NetworkImage(image)
                          : null,
                      child: (image == null || image.isEmpty)
                          ? DefaultImage(name: name)
                          : null,
                    ),
                    title: Text(
                      name,
                      style: const TextStyle(color: Colors.white),
                    ),
                    // subtitle: Text(email, style: const TextStyle(color: Colors.grey)),
                    onTap: ()  {
                      onSelect(
                      TeamMemberModel(name: name, image: (image != null && image.isNotEmpty) ? image : null)
                      );
                      Navigator.pop(context);
                    },
                  );
                },
              );
            },
          ),
        ),
      );
    },
  );
}
