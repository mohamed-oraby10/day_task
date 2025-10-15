import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  final String title;
  final String body;
  final String userId;
  final Timestamp? time;
  NotificationModel({
    required this.time,
    required this.userId,
    required this.title,
    required this.body,
  });

  factory NotificationModel.fromJson(jsonData) {
    return NotificationModel(
      title: jsonData['title'],
      body: jsonData['body'],
      userId: jsonData['userId'],
      time: jsonData['timestamp'] != null
          ? jsonData['timestamp'] as Timestamp
          : null,
    );
  }
}
