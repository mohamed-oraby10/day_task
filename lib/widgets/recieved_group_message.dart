import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_task/model/message_model.dart';
import 'package:day_task/widgets/recieved_message.dart';
import 'package:day_task/widgets/default_image.dart';
import 'package:flutter/material.dart';

class RecievedGroupMessage extends StatelessWidget {
  const RecievedGroupMessage({super.key, required this.message});
  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance
          .collection('users')
          .doc(message.userId)
          .get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 6),
                child: CircleAvatar(radius: 12, backgroundColor: Colors.grey),
              ),
              RecievedMessage(message: message),
            ],
          );
        }

        final userData = snapshot.data!.data() as Map<String, dynamic>?;
        final userName = userData?['name'] ?? 'User';
        final userImage = userData?['photo'];

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 6, top: 8),
              child: userImage != null && userImage.isNotEmpty
                  ? CircleAvatar(
                      radius: 13,
                      backgroundImage: NetworkImage(userImage),
                    )
                  : DefaultImage(name: userName),
            ),
            RecievedMessage(message: message),
          ],
        );
      },
    );
  }
}
