import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nailed_it/data/provider/notification/notification_remote_provider.dart';

class NotificationRemoteProviderImpl implements NotificationRemoteProvider {
  NotificationRemoteProviderImpl({
    required FirebaseFirestore storage,
  }) : _storage = storage;

  final FirebaseFirestore _storage;

  @override
  Future<void> updateIsReadById(String nid, bool isRead) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    await _storage
        .collection('user_notifications')
        .doc(uid)
        .collection('notifications')
        .doc(nid)
        .update({'is_read': isRead});
  }

  @override
  Future<void> deleteAll() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    await _storage.collection('user_notifications').doc(uid).delete();
  }

  @override
  Future<bool> existsNotification() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    DocumentSnapshot snapshot =
        await _storage.collection('user_notifications').doc(uid).get();

    return snapshot.exists;
  }

  @override
  Future<List<Map<String, dynamic>>> findAllBySmallerOrEqual(
    DateTime updatedAt,
    String lastDocId,
    int size,
  ) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    Timestamp updatedAtTimestamp = Timestamp.fromDate(updatedAt);

    QuerySnapshot snapshot;

    if (lastDocId.isEmpty) {
      snapshot = await _storage
          .collection('user_notifications')
          .doc(uid)
          .collection('notifications')
          .where('created_at', isLessThanOrEqualTo: updatedAtTimestamp)
          .orderBy('created_at', descending: true)
          .limit(size)
          .get();
    } else {
      DocumentSnapshot currentLastSnapshot = await _storage
          .collection('user_notifications')
          .doc(uid)
          .collection('notifications')
          .doc(lastDocId)
          .get();

      snapshot = await _storage
          .collection('user_notifications')
          .doc(uid)
          .collection('notifications')
          .where('created_at', isLessThanOrEqualTo: updatedAtTimestamp)
          .orderBy('created_at', descending: true)
          .startAfterDocument(currentLastSnapshot)
          .limit(size)
          .get();
    }

    return snapshot.docs
        .map((notification) => {
              'id': notification.id,
              'content': notification.get('content'),
              'created_at': notification.get('created_at'),
              'is_read': notification.get('is_read'),
            })
        .toList();
  }

  @override
  Future<Timestamp> findUpdatedAt() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    DocumentSnapshot snapshot =
        await _storage.collection('user_notifications').doc(uid).get();

    return snapshot.get('updated_at');
  }
}
