import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  final String lastMessage;
    final Timestamp lastMessageTime;


  ChatModel( {required this.lastMessageTime,required this.lastMessage});

  factory ChatModel.formJson(jsonData) {
    return ChatModel(lastMessage: jsonData['lastMessage'],lastMessageTime: jsonData['lastMessageTime']);
  }
}
