import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_task/constants.dart';
import 'package:day_task/model/message_model.dart';
import 'package:day_task/model/user_model.dart';
import 'package:day_task/provider/user_provider.dart';
import 'package:day_task/widgets/chat_text_field.dart';
import 'package:day_task/widgets/default_image.dart';
import 'package:day_task/widgets/sending_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  CollectionReference messages = FirebaseFirestore.instance
      .collection(kChats)
      .doc("chatId")
      .collection(kMessages);
  TextEditingController controller = TextEditingController();
  late UserModel user;
  @override
  Widget build(BuildContext context) {
    user = ModalRoute.of(context)!.settings.arguments as UserModel;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MessageModel> messagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(MessageModel.fromJson(snapshot.data!.docs[i]));
          }
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: SvgPicture.asset("assets/images/arrowleft.svg"),
              ),
              backgroundColor: kBackgroundColor,
              elevation: 0,
              foregroundColor: Colors.white,

              title: Row(
                children: [
                  user.image == null
                      ? DefaultImage(name: user.name)
                      : CircleAvatar(
                          radius: 22,
                          backgroundImage: NetworkImage(user.image!),
                        ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            user.name,
                            softWrap: true,
                            overflow: TextOverflow.visible,
                            style: const TextStyle(fontSize: 14),
                          ),
                          const Text(
                            'Online',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/images/video.svg'),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset('assets/images/callcalling.svg'),
                  ),
                ),
              ],
            ),
            body: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 10,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: messagesList.length,
                          itemBuilder: (context, index) {
                            return SendingMeaasge(message: messagesList[index]);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ChatTextField(
                              controller: controller,
                              onSubmitted: (data) {
                                messages.add({
                                  'text': data,
                                  'senderEmail': Provider.of<UserProvider>(
                                    context,
                                    listen: false,
                                  ).email,
                                  'senderId':
                                      FirebaseAuth.instance.currentUser!.uid,
                                  'timestamp': FieldValue.serverTimestamp(),
                                });
                                controller.clear();
                              },
                            ),
                            SizedBox(width: 10),

                            Container(
                              height: 55,
                              width: 55,
                              color: kSecondColor,
                              child: IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  'assets/images/microphone2.svg',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
