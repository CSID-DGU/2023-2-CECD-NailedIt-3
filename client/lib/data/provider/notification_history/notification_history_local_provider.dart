import 'package:nailed_it/app/config/local_database_config.dart';

abstract class NotificationHistoryLocalProvider {
  Future<NotificationHistoryData> save(
    NotificationHistoryCompanion entity,
  );

  Future<void> updateIsReadByData(
    NotificationHistoryData entity,
    bool isRead,
  );

  Future<int> findMaxID();
}
