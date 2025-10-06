import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_task/constants.dart';
import 'package:day_task/enum.dart';
import 'package:day_task/model/chat_model.dart';
import 'package:day_task/model/user_model.dart';
import 'package:day_task/widgets/chat_person.dart';
import 'package:day_task/widgets/custom_app_bar.dart';
import 'package:day_task/widgets/custom_button.dart';
import 'package:day_task/utilitis/app_routes.dart';
import 'package:day_task/utilitis/custom_bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MassegesScraan extends StatefulWidget {
  const MassegesScraan({super.key});

  @override
  State<MassegesScraan> createState() => _MassegesScraanState();
}

class _MassegesScraanState extends State<MassegesScraan> {
  CollectionReference chats = FirebaseFirestore.instance.collection(kChats);
  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser!;

    return StreamBuilder<QuerySnapshot>(
      stream: chats
          .where('members', arrayContains: currentUser.uid)
          .snapshots(),
      builder: (context, snapshot) {
        List<ChatModel> chatList = [];

        if (snapshot.hasData) {
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            chatList.add(ChatModel.formJson(snapshot.data!.docs[i]));
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
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      text: 'Chat',
                      onPress: () {
                        Navigator.pushNamed(context, AppRoutes.messageRoute);
                      },
                      isMessage: true,
                    ),
                    SizedBox(width: 20),
                    CustomButton(
                      text: 'Groupes',
                      onPress: () {
                        Navigator.pushNamed(context, AppRoutes.groupRoute);
                      },
                      isMessage: false,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: chatList.length,
                  itemBuilder: (context, index) {
                    final chat = chatList[index];
                    final otherUserId = chat.userId == currentUser.uid
                        ? chat.currentUserId
                        : chat.userId;
                    return FutureBuilder<DocumentSnapshot>(
                      future: FirebaseFirestore.instance
                          .collection('users')
                          .doc(chat.userId)
                          .get(),
                      builder: (context, userSnapshot) {
                        if (!userSnapshot.hasData) {
                          return const Center(
                            child: Text(
                              'No chats yet',
                              style: TextStyle(color: kMainColor, fontSize: 16),
                            ),
                          );
                        }

                        final userData = userSnapshot.data!.data();

                        final user = UserModel.fromJson(
                          otherUserId,
                          userData as Map<String, dynamic>,
                        );

                        return ChatPerson(chat: chatList[index], user: user);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 10),
            child: CustomButton(
              text: "Start Chat",
              isMessage: true,
              onPress: () {
                Navigator.pushNamed(context, AppRoutes.newMessageRoute);
              },
            ),
          ),
        );
      },
    );
  }
}
