import 'package:get/get.dart';
import 'package:nailed_it/app/config/local_database_config.dart';
import 'package:nailed_it/data/factory/local_database_factory.dart';
import 'package:nailed_it/data/provider/notification_history/notification_history_local_provider.dart';
import 'package:nailed_it/domain/entity/notification/notification_history_state.dart';
import 'package:nailed_it/domain/repository/notification_history/notification_history_repository.dart';

class NotificationHistoryRepositoryImpl extends GetxService
    implements NotificationHistoryRepository {
  late final NotificationHistoryLocalProvider _localProvider;

  @override
  void onInit() {
    super.onInit();

    _localProvider = LocalDatabaseFactory.notificationHistoryLocalProvider;
  }

  @override
  Future<void> updateIsReadById(int params) async {
    NotificationHistoryData data = await _localProvider.findById(params);

    if (data.isRead) {
      return;
    }

    await _localProvider.updateIsReadByData(data, true);
  }

  @override
  Future<void> deleteAll() {
    return _localProvider.deleteAll();
  }

  @override
  Future<List<NotificationHistoryState>> readNotificationHistories(
    int index,
    int page,
    int size,
  ) async {
    List<NotificationHistoryData> result =
        await _localProvider.findAllBySmallerOrEqual(
      index,
      page,
      size,
    );

    return result
        .map((e) => NotificationHistoryState.fromJson(e.toJson()))
        .toList();
  }

  @override
  Future<int> readNotificationHistoryEndIndex() {
    return _localProvider.findEndIndex();
  }
}
