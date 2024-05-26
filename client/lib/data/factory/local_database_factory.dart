import 'package:nailed_it/app/config/local_database_config.dart';
import 'package:nailed_it/data/provider/notification_history/notification_history_local_provider.dart';

abstract class LocalDatabaseFactory {
  static LocalDatabase? _instance;

  static LocalDatabase get instance => _instance!;

  static NotificationHistoryLocalProvider
      get notificationHistoryLocalProvider =>
          _instance!.notificationHistoryLocalProviderImpl;

  static void onInit() {
    _instance = LocalDatabase();
  }
}
