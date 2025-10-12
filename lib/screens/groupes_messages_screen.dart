import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_task/constants.dart';
import 'package:day_task/enum.dart';
import 'package:day_task/model/group_chat_model.dart';
import 'package:day_task/widgets/custom_app_bar.dart';
import 'package:day_task/widgets/custom_button.dart';
import 'package:day_task/widgets/message_category.dart';
import 'package:day_task/utilitis/app_routes.dart';
import 'package:day_task/utilitis/custom_bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GroupesChatScreen extends StatefulWidget {
  const GroupesChatScreen({super.key});

  @override
  State<GroupesChatScreen> createState() => _GroupesChatScreenState();
}

class _GroupesChatScreenState extends State<GroupesChatScreen> {
  CollectionReference groups = FirebaseFirestore.instance.collection(kGroups);
  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser!;

    return StreamBuilder(
      stream: groups.snapshots(),
      builder: (context, snapshot) {
        List<GroupChatModel> groupsList = [];
        if (snapshot.hasData) {
          for (var doc in snapshot.data!.docs) {
            final group = GroupChatModel.fromJson(doc);

            final bool isMember = group.groupMembers.any(
              (member) => member['id'] == currentUser.uid,
            );

            if (isMember) {
              groupsList.add(group);
            }
          }
        }
        return Scaffold(
          bottomNavigationBar: const CustomBottomNavigationBar(
            selectedMenu: MenuState.chat,
          ),
          appBar: CustomAppBar(
            title: 'Messages',
            sufImage: "assets/images/edit.svg",
            onPress: () {
              Navigator.pushNamed(context, AppRoutes.newMessageRoute);
            },
          ),
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      text: "Chat",
                      onPress: () {
                        Navigator.pop(context);
                      },
                      isMessage: false,
                    ),
                    CustomButton(text: "Groupes", isMessage: true),
                  ],
                ),
              ),
              Expanded(
                child: groupsList.isEmpty
                    ? Center(
                        child: Text(
                          'No groups yet.',
                          style: TextStyle(color: kMainColor, fontSize: 17),
                        ),
                      )
                    : ListView.builder(
                        itemCount: groupsList.length,
                        itemBuilder: (context, index) {
                          return MessageCategory(group: groupsList[index]);
                        },
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
