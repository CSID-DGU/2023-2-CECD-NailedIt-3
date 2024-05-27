import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:nailed_it/data/factory/remote_storage_factory.dart';
import 'package:nailed_it/data/provider/notification/notification_remote_provider.dart';
import 'package:nailed_it/domain/entity/notification/notification_state.dart';
import 'package:nailed_it/domain/repository/notification/notification_repository.dart';

class NotificationRepositoryImpl extends GetxService
    implements NotificationRepository {
  late final NotificationRemoteProvider _remoteProvider;

  @override
  void onInit() {
    super.onInit();

    _remoteProvider = RemoteStorageFactory.notificationRemoteProvider;
  }

  @override
  Future<void> updateIsReadById(String id) async {
    await _remoteProvider.updateIsReadById(id, true);
  }

  @override
  Future<void> deleteAll() {
    return _remoteProvider.deleteAll();
  }

  @override
  Future<bool> existsNotification() {
    return _remoteProvider.existsNotification();
  }

  @override
  Future<List<NotificationState>> readNotifications(
    DateTime updateAt,
    String lastDocId,
    int size,
  ) async {
    List<Map<String, dynamic>> result =
        await _remoteProvider.findAllBySmallerOrEqual(
      updateAt,
      lastDocId,
      size,
    );

    print(result.length);

    return result
        .map(
          (e) => NotificationState.fromJson(e),
        )
        .toList();
  }

  @override
  Future<DateTime> readLastUpdateAt() async {
    Timestamp timestamp = await _remoteProvider.findUpdatedAt();

    return timestamp.toDate();
  }
}
