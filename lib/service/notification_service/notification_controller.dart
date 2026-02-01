import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:day_task/utilitis/app_routes.dart';

class NotificationController {
  @pragma('vm:entry-point') 
  static Future<void> onActionReceived(ReceivedAction receivedAction) async {
    final payload = receivedAction.payload ?? {};
    final route = payload['route'];

    if (route != null) {
      navigatorKey.currentState?.pushNamed(route);
    }
  }
}
