import 'package:day_task/constants.dart';
import 'package:day_task/helper/chat%20methods/get_smart_time_method.dart';
import 'package:day_task/model/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificationCategory extends StatelessWidget {
  const NotificationCategory({super.key, required this.notification});
  final NotificationModel notification;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: kSecondColor,
            child: const Icon(FontAwesomeIcons.listCheck, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(height: 4),
                Text(
                  notification.body,
                  style: const TextStyle(color: kMainColor),
                ),
              ],
            ),
          ),
          Spacer(),
          Text(
            getSmartTime(notification.time),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
