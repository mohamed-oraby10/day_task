import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  final String lastMessage;
  final Timestamp? lastMessageTime;
  final String userId;
  final String currentUserId;

  ChatModel({
    required this.userId,
    required this.currentUserId,
     this.lastMessageTime,
    required this.lastMessage,
  });

  factory ChatModel.formJson(jsonData) {
    return ChatModel(
      lastMessage: jsonData['lastMessage'],
      lastMessageTime: jsonData['lastMessageTime'],
      userId: jsonData['members'][1],
      currentUserId: jsonData['members'][0],
    );
  }
}
