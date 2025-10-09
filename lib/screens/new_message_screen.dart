import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_task/constants.dart';
import 'package:day_task/model/user_model.dart';
import 'package:day_task/screens/chat_screen.dart';
import 'package:day_task/widgets/create_group_button.dart';
import 'package:day_task/widgets/custom_app_bar.dart';
import 'package:day_task/widgets/new_message_category.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: users.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<UserModel> userslist = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            var doc = snapshot.data!.docs[i];
            userslist.add(
              UserModel.fromJson(doc.id, doc.data() as Map<String, dynamic>),
            );
          }
          return Scaffold(
            appBar: CustomAppBar(
              title: "New Message",
              sufImage: "assets/images/searchnormal1.svg",
            ),

            body: Column(
              children: [
                CreateGroupButton(),
                Expanded(
                  child: ListView.builder(
                    itemCount: userslist.length,
                    itemBuilder: (context, index) {
                      final user = userslist[index];
                      return NewMessageCategory(
                        user: user,
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
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator(color: kMainColor));
        }
      },
    );
  }
}
