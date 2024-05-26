import 'package:nailed_it/domain/entity/notification/notification_history_state.dart';

abstract class NotificationHistoryRepository {
  Future<int> readNotificationHistoryEndIndex();

  Future<List<NotificationHistoryState>> readNotificationHistories(
    int index,
    int page,
    int size,
  );
}
