import 'dart:async';
import 'package:firebase_database/firebase_database.dart';

class PresenceService {
  final String uid;
  final DatabaseReference _db = FirebaseDatabase.instance.ref();

  PresenceService(this.uid);

  DatabaseReference get _statusRef => _db.child('status/$uid');
  DatabaseReference get _connectedRef => FirebaseDatabase.instance.ref('.info/connected');

  StreamSubscription? _connSub;

  void start() {
    _connSub = _connectedRef.onValue.listen((event) async {
      final connected = (event.snapshot.value == true);
      if (connected) {
        await _statusRef.set({
          'state': 'online',
          'last_changed': ServerValue.timestamp,
        });
        await _statusRef.onDisconnect().set({
          'state': '',
          'last_changed': ServerValue.timestamp,
        });
      }
    });
  }

  Future<void> stop() async {
    await _connSub?.cancel();
    await _statusRef.set({
      'state': '',
      'last_changed': ServerValue.timestamp,
    });
  }
}
