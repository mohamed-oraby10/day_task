import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_task/constants.dart';
import 'package:day_task/provider/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> sendMessage(
  String data,
  BuildContext context,
  dynamic messages,
  String? chatId,
  dynamic user,
  dynamic controller,
  ScrollController scrollController,
) async {
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
  };

  await messages.add(messageData);

  await FirebaseFirestore.instance.collection(kChats).doc(chatId).set({
    'lastMessage': data,
    'lastMessageTime': FieldValue.serverTimestamp(),
    'lastMessageType': 'text',
    'members': [currentUser.uid, user.uid],
    'createdAt': FieldValue.serverTimestamp(),
    'lastMessageSeen': false,
    'lastMessageSenderId': currentUser.uid,
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
