import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_task/constants.dart';
import 'package:day_task/enum.dart';
import 'package:day_task/model/notification_model.dart';
import 'package:day_task/service/notification_service.dart';
import 'package:day_task/widgets/custom_app_bar.dart';
import 'package:day_task/utilitis/custom_bottom_bar.dart';
import 'package:day_task/widgets/custom_sized_box.dart';
import 'package:day_task/widgets/notifiy_category.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  void initState() {
    super.initState();
    NotificationService.init();
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser!;
    CollectionReference notifications = FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.uid)
        .collection(kNotifications);

    return StreamBuilder<QuerySnapshot>(
      stream: notifications.orderBy('timestamp', descending: true).snapshots(),
      builder: (context, snapshot) {
        List<NotificationModel> notificationsList = [];

        if (snapshot.hasData) {
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            notificationsList.add(
              NotificationModel.fromJson(
                snapshot.data!.docs[i].data() as Map<String, dynamic>,
              ),
            );
          }
        }
        final now = DateTime.now();
        final oneDayAgo = now.subtract(const Duration(days: 1));

        final earlierNotifications = notificationsList
            .where((n) => n.time!.toDate().isBefore(oneDayAgo))
            .toList();

        return Scaffold(
          bottomNavigationBar: const CustomBottomNavigationBar(
            selectedMenu: MenuState.notifications,
          ),
          appBar: const CustomAppBar(title: "Notifications"),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: const Text(
                    'New',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                notificationsList.isEmpty
                    ? CustomSizedBox(messageText: 'No new notifications yet.')
                    : SizedBox(
                        height: 300,
                        child: ListView.builder(
                          itemCount: notificationsList.length,
                          itemBuilder: (context, index) {
                            final item = notificationsList[index];
                            return NotificationCategory(notification: item);
                          },
                        ),
                      ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: const Text(
                    'Earlier',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                earlierNotifications.isEmpty
                    ? CustomSizedBox(
                        messageText: 'No earlier notifications yet.',
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: earlierNotifications.length,
                          itemBuilder: (context, index) {
                            final earlier = earlierNotifications[index];
                            return NotificationCategory(notification: earlier);
                          },
                        ),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
