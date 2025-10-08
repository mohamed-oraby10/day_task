import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:timeago/timeago.dart' as timeago;

String getSmartTime(Timestamp? timestamp) {
  if (timestamp == null) return "";
  DateTime date = timestamp.toDate();

  final now = DateTime.now();
  final difference = now.difference(date);

  if (difference.inDays < 1) {
    return timeago.format(date, locale: 'en_short'); 
  }

  if (difference.inDays < 365) {
    return "${date.day} ${_monthName(date.month)}";
  }

  return "${date.year}";
}

String _monthName(int month) {
  const months = [
    '',
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  ];
  return months[month];
}
