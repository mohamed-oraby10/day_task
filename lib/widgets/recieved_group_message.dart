import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_task/model/message_model.dart';
import 'package:day_task/widgets/recieved_message.dart';
import 'package:day_task/widgets/default_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              Padding(
                padding: EdgeInsets.only(left: 6.w),
                child: CircleAvatar(radius: 12.r, backgroundColor: Colors.grey),
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
              padding: EdgeInsets.only(left: 6.w, top: 8.h),
              child: userImage != null && userImage.isNotEmpty
                  ? CircleAvatar(
                      radius: 12.r,
                      backgroundImage: NetworkImage(userImage),
                    )
                  : CircleAvatar(
                      radius: 12.r,
                      child: DefaultImage(name: userName),
                    ),
            ),
            RecievedMessage(message: message),
          ],
        );
      },
    );
  }
}
