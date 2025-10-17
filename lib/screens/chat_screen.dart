import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_task/constants.dart';
import 'package:day_task/helper/chat%20methods/mark_message_as_seen.dart';
import 'package:day_task/helper/chat%20methods/send_message_method.dart';
import 'package:day_task/model/message_model.dart';
import 'package:day_task/model/user_model.dart';
import 'package:day_task/widgets/chat_screen_app_bar.dart';
import 'package:day_task/widgets/chat_text_field.dart';
import 'package:day_task/widgets/recieved_message.dart';
import 'package:day_task/widgets/sending_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late CollectionReference messages;
  late String chatId;
  late UserModel user;
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();
  String userStatus = '';
  DatabaseReference? statusRef;
  StreamSubscription<DatabaseEvent>? statusSub;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    user = ModalRoute.of(context)!.settings.arguments as UserModel;

    statusRef = FirebaseDatabase.instance.ref('status/${user.uid}');
    statusSub = statusRef!.onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;
      if (data != null && mounted) {
        setState(() {
          userStatus = data['state'] ?? '';
        });
      }
    });

    final currentUser = FirebaseAuth.instance.currentUser!;
    chatId = currentUser.uid.hashCode <= user.uid.hashCode
        ? "${currentUser.uid}_${user.uid}"
        : "${user.uid}_${currentUser.uid}";

    messages = FirebaseFirestore.instance
        .collection(kChats)
        .doc(chatId)
        .collection(kMessages);
    await markMessagesAsSeen(messages, chatId);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy('timestamp', descending: false).snapshots(),
      builder: (context, snapshot) {
        List<MessageModel> messagesList = [];
        if (snapshot.hasData) {
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(MessageModel.fromJson(snapshot.data!.docs[i]));
          }
        }
        return Scaffold(
          appBar: ChatScreenAppBar(
            name: user.name,
            image: user.image,
            userStatus: userStatus,
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: messagesList.length,
                  itemBuilder: (context, index) {
                    final message = messagesList[index];
                    final currentUser = FirebaseAuth.instance.currentUser!;
                    if (message.userId == currentUser.uid) {
                      return SendingMeaasge(message: message);
                    } else {
                      return RecievedMessage(message: message);
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ChatTextField(
                      controller: controller,
                      onSubmitted: (data) => sendMessage(data, context, messages, chatId, user, controller, scrollController),
                    ),
                    SizedBox(width: 10.w),
                    Container(
                      height: 57.h,
                      width: 57.w,
                      color: kSecondColor,
                      child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/images/microphone2.svg',
                          height: 24.h,
                          width: 24.w,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    statusSub?.cancel();
    super.dispose();
  }
}
