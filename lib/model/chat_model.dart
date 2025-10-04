import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  final String lastMessage;
  final Timestamp lastMessageTime;
  final String userId;

  ChatModel({
    required this.userId,
    required this.lastMessageTime,
    required this.lastMessage,
  });

  factory ChatModel.formJson(jsonData) {
    return ChatModel(
      lastMessage: jsonData['lastMessage'],
      lastMessageTime: jsonData['lastMessageTime'],
      userId: jsonData['members'][1],
    );
  }
}
