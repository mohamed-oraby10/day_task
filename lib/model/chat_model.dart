import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  final String lastMessage;
  final Timestamp? lastMessageTime;
  final String userId;
  final String currentUserId;
  final bool lastMessageSeen;
  final String? lastMessageSenderId;

  ChatModel({
    required this.lastMessageSeen,
    required this.lastMessageSenderId,

    required this.userId,
    required this.currentUserId,
    this.lastMessageTime,
    required this.lastMessage,
  });

  factory ChatModel.formJson(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return ChatModel(
      lastMessage: data['lastMessage'] ?? '',
      lastMessageTime: data['lastMessageTime'],
      userId: data['members'][1],
      currentUserId: data['members'][0],
      lastMessageSeen: data.containsKey('lastMessageSeen')
          ? data['lastMessageSeen']
          : true,
      lastMessageSenderId: data['lastMessageSenderId'],
    );
  }
}
