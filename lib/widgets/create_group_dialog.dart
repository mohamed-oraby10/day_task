import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_task/constants.dart';
import 'package:day_task/widgets/group_members.dart';
import 'package:day_task/widgets/text_input.dart';
import 'package:flutter/material.dart';

class CreateGroupDialog extends StatelessWidget {
  const CreateGroupDialog({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> selectedMembers = [];
    GlobalKey<FormState> formKey = GlobalKey();
    final TextEditingController groupNameController = TextEditingController();
    CollectionReference groups = FirebaseFirestore.instance.collection(kGroups);

    Future<void> createGroup() async {
      if (formKey.currentState!.validate()) {
        final groupMembers = selectedMembers
            .map((m) => {'id': m['id'], 'name': m['name'], 'photo': m['photo']})
            .toList();
        final groupData = {
          'name': groupNameController.text.trim(),
          'icon': null,
          'groupMembers': groupMembers,
        };
        await groups.add(groupData);
        Navigator.pop(context);
      }
    }

    return Form(
      key: formKey,
      child: AlertDialog(
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

              final users = snapshot.data!.docs.map((doc) {
                return {
                  'id': doc.id,
                  'name': doc['name'],
                  'photo': doc['photo'],
                };
              }).toList();

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
                    child: TextInput(
                      hint: 'Group name',
                      controller: groupNameController,
                    ),
                  ),
                  Text(
                    'Group members',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  Expanded(
                    child: GroupMembers(
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
                onPressed: () async {
                  await createGroup();
                },
                child: Text(
                  'Create',
                  style: TextStyle(color: kMainColor, fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
