import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_task/constants.dart';
import 'package:day_task/enum.dart';
import 'package:day_task/model/notification_model.dart';
import 'package:day_task/widgets/custom_app_bar.dart';
import 'package:day_task/utilitis/custom_bottom_bar.dart';
import 'package:day_task/widgets/custom_sized_box.dart';
import 'package:day_task/widgets/notifiy_category.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  void initState() {
    super.initState();
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
        final newNotifications = notificationsList
            .where((n) => n.time!.toDate().isAfter(oneDayAgo))
            .toList();
        final earlierNotifications = notificationsList
            .where((n) => n.time!.toDate().isBefore(oneDayAgo))
            .toList();

        return Scaffold(
          bottomNavigationBar: const CustomBottomNavigationBar(
            selectedMenu: MenuState.notifications,
          ),
          appBar: const CustomAppBar(title: "Notifications"),
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 25.w),
            child: notificationsList.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 15.h),
                        child: Text(
                          'New',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                      newNotifications.isEmpty
                          ? CustomSizedBox(
                              messageText: 'No new notifications yet.',
                            )
                          : SizedBox(
                              height: 300.h,
                              child: ListView.builder(
                                itemCount: newNotifications.length,
                                itemBuilder: (context, index) {
                                  final item = newNotifications[index];
                                  return NotificationCategory(
                                    notification: item,
                                  );
                                },
                              ),
                            ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        child: Text(
                          'Earlier',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                          ),
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
                                  return NotificationCategory(
                                    notification: earlier,
                                  );
                                },
                              ),
                            ),
                    ],
                  )
                : Center(
                    child: CustomSizedBox(messageText: 'No notifications yet.'),
                  ),
          ),
        );
      },
    );
  }
}
