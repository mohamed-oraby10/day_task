import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_task/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    const AndroidInitializationSettings androidInit =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initSettings = InitializationSettings(
      android: androidInit,
    );

    await _notifications.initialize(initSettings);
    tz.initializeTimeZones();
  }

  Future<void> showNotification({
    required String title,
    required String body,
  }) async {
    final currentUser = FirebaseAuth.instance.currentUser!;
    final userNotifications = FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.uid)
        .collection(kNotifications);

    final notificationData = {
      "title": title,
      "body": body,
      "userId": currentUser.uid,
      "timestamp": FieldValue.serverTimestamp(),
    };

    await userNotifications.add(notificationData);

    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
          'day_task_channel',
          'Day Task Notifications',
          importance: Importance.max,
          priority: Priority.high,
        );

    const NotificationDetails details = NotificationDetails(
      android: androidDetails,
    );

    await _notifications.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000,
      title,
      body,
      details,
    );
  }

  Future<void> scheduleDailyNotification({
    required String title,
    required String body,
    int hour = 9,
    int minute = 0,
  }) async {
    final now = tz.TZDateTime.now(tz.local);
    var scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );

    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
          'day_task_channel',
          'Day Task Notifications',
          importance: Importance.max,
          priority: Priority.high,
        );

    const NotificationDetails details = NotificationDetails(
      android: androidDetails,
    );

    await _notifications.zonedSchedule(
      0,
      title,
      body,
      scheduledDate,
      details,
      androidAllowWhileIdle: true,
      matchDateTimeComponents: DateTimeComponents.time,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
}
