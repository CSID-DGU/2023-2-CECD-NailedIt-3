import 'package:nailed_it/domain/entity/notification/notification_state.dart';

abstract class NotificationRepository {
  Future<void> updateIsReadById(String id);

  Future<void> deleteAll();

  Future<bool> existsNotification();

  Future<DateTime> readLastUpdateAt();

  Future<List<NotificationState>> readNotifications(
    DateTime updatedAt,
    String lastDocId,
    int size,
  );
}
