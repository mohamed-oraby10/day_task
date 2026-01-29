import 'package:awesome_notifications/awesome_notifications.dart';

class NotificationService {
  static final AwesomeNotifications notification = AwesomeNotifications();
  Future<void> init() async {
    await notification.initialize('resource://drawable/bro', [
      NotificationChannel(
        channelKey: 'channelKey',
        channelName: 'channelName',
        channelDescription: 'channelDescription',
        playSound: true,
        channelShowBadge: true,
      ),
    ]);
  }

  Future<void> showNotification() async {
    await notification.createNotification(
      content: NotificationContent(
        id: 0,
        channelKey: 'channelKey',
        title: 'Here’s your daily tasks',
        body: 'Let’s get today’s tasks done! 💪',
      ),
      schedule: NotificationCalendar(
        hour: 23,
        minute: 08,
        second: 0,
        repeats: true,
      ),
    );
  }
}
