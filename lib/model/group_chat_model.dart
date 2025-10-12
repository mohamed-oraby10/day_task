import 'package:cloud_firestore/cloud_firestore.dart';

class GroupChatModel {
  final List<dynamic> groupMembers;
  final String name;
  final String? icon;
  final String id;
  final String? lastMessage;
  final Timestamp? lastMessageTime;
  final String? lastMessageSenderName;
  GroupChatModel({
    required this.lastMessageSenderName,
    required this.id,
    this.lastMessage,
    this.lastMessageTime,
    this.icon,
    required this.groupMembers,
    required this.name,
  });

  factory GroupChatModel.fromJson(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return GroupChatModel(
      id: doc.id,
      name: data['name'] ?? '',
      icon: data['icon'],
      groupMembers: List<dynamic>.from(data['groupMembers']),
      lastMessage: data['lastMessage'] ?? '',
      lastMessageTime: data['lastMessageTime'] is Timestamp
          ? data['lastMessageTime']
          : null,
      lastMessageSenderName: data['lastMessageSenderName'],
    );
  }
}
