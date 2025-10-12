import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_task/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> markMessagesAsSeen(CollectionReference messages,String chatId) async {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final unreadMessages = await messages
      .where('senderId', isNotEqualTo: currentUser.uid)
      .where('isSeen', isEqualTo: false)
      .get();

  for (var doc in unreadMessages.docs) {
    await doc.reference.update({'isSeen': true});
  }
  await FirebaseFirestore.instance.collection(kChats).doc(chatId).update({
  'lastMessageSeen': true,
});

}
