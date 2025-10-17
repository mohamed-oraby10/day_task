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
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                padding:  EdgeInsets.symmetric(vertical: 10.h),
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
                    SizedBox(width: 20.w),
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
                    final sortedChats = chatList
                      ..sort((a, b) {
                        final aTime = a.lastMessageTime ?? Timestamp(0, 0);
                        final bTime = b.lastMessageTime ?? Timestamp(0, 0);
                        return bTime.compareTo(aTime); 
                      });

                    final chat = sortedChats[index];
                    final otherUserId = chat.userId == currentUser.uid
                        ? chat.currentUserId
                        : chat.userId;

                    return FutureBuilder<DocumentSnapshot>(
                      future: FirebaseFirestore.instance
                          .collection('users')
                          .doc(otherUserId)
                          .get(),
                      builder: (context, userSnapshot) {
                        if (!userSnapshot.hasData) {
                          return const SizedBox();
                        }

                        final userData = userSnapshot.data!.data();

                        if (userData == null) return const SizedBox();

                        final user = UserModel.fromJson(
                          otherUserId,
                          userData as Map<String, dynamic>,
                        );

                        return ChatPerson(chat: chat, user: user);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          floatingActionButton: Padding(
            padding:  EdgeInsets.symmetric(vertical: 70.h, horizontal: 10.w),
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
