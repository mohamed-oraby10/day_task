import 'package:awesome_notifications/awesome_notifications.dart';

class NotificationService {
  static final AwesomeNotifications notification = AwesomeNotifications();
  Future<void> init() async {
    await notification.initialize(null, [
      NotificationChannel(
        channelKey: 'channelKey',
        channelName: 'Daily Tasks',
        channelDescription: 'Daily task reminders',
        playSound: true,
        channelShowBadge: true,
      ),
    ]);
  }

  Future<void> showNotification() async {
    bool isAllowed = await notification.isNotificationAllowed();
    if (!isAllowed) {
      await notification.requestPermissionToSendNotifications();
    }
    await notification.createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: 'channelKey',
        title: 'Here\'s your daily tasks',
        body: 'Let\'s get today\'s tasks done! 💪',
      ),
      schedule: NotificationCalendar(
        hour: 10,
        minute: 10,
        second: 0,
        repeats: true,
      ),
    );
  }
}
