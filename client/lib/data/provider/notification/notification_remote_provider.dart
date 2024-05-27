import 'package:cloud_firestore/cloud_firestore.dart';

abstract class NotificationRemoteProvider {
  Future<void> updateIsReadById(
    String nid,
    bool isRead,
  );

  Future<void> deleteAll();

  Future<Timestamp> findUpdatedAt();

  Future<List<Map<String, dynamic>>> findAllBySmallerOrEqual(
    DateTime updateAt,
    String docId,
    int size,
  );

  Future<bool> existsNotification();
}
