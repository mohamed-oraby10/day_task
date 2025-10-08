import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_task/constants.dart';
import 'package:day_task/model/message_model.dart';
import 'package:day_task/model/user_model.dart';
import 'package:day_task/provider/user_provider.dart';
import 'package:day_task/widgets/chat_text_field.dart';
import 'package:day_task/widgets/default_image.dart';
import 'package:day_task/widgets/recieved_message.dart';
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
  late CollectionReference messages;
  late String chatId;
  late UserModel user;
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    user = ModalRoute.of(context)!.settings.arguments as UserModel;

    final currentUser = FirebaseAuth.instance.currentUser!;
    chatId = currentUser.uid.hashCode <= user.uid.hashCode
        ? "${currentUser.uid}_${user.uid}"
        : "${user.uid}_${currentUser.uid}";

    messages = FirebaseFirestore.instance
        .collection(kChats)
        .doc(chatId)
        .collection(kMessages);
  }

  Future<void> sendMessage(String data) async {
    if (data.trim().isEmpty) return;

    final currentUser = FirebaseAuth.instance.currentUser!;
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    final messageData = {
      'text': data,
      'senderEmail': userProvider.userModel?.email ?? currentUser.email,
      'senderId': currentUser.uid,
      'timestamp': FieldValue.serverTimestamp(),
      'type': 'text',
      'isSeen': false,
      'mediaUrl': ''
    };

    await messages.add(messageData);

    await FirebaseFirestore.instance.collection(kChats).doc(chatId).set({
      'lastMessage': data,
      'lastMessageTime': FieldValue.serverTimestamp(),
      'lastMessageType': 'text',
      'members': [currentUser.uid, user.uid],
      'createdAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));

    controller.clear();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
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
                          overflow: TextOverflow.ellipsis,
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
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ChatTextField(
                      controller: controller,
                      onSubmitted: (data) => sendMessage(data),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 55,
                      width: 55,
                      color: kSecondColor,
                      child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset('assets/images/microphone2.svg'),
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
}
