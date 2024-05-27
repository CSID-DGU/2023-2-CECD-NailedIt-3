import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:nailed_it/data/factory/remote_storage_factory.dart';
import 'package:nailed_it/data/provider/user/user_remote_provider.dart';
import 'package:nailed_it/domain/repository/user/user_repository.dart';

class UserRepositoryImpl extends GetxService implements UserRepository {
  late final UserRemoteProvider _remoteProvider;

  @override
  void onInit() {
    super.onInit();

    _remoteProvider = RemoteStorageFactory.userRemoteProvider;
  }

  @override
  Future<void> updateAllowedNotification(bool isAllowedNotification) async {
    await _remoteProvider.setAllowedNotification(isAllowedNotification);
  }

  @override
  Future<bool> updateDeviceToken(String deviceToken) async {
    try {
      await _remoteProvider.setDeviceToken(deviceToken);

      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<bool> deleteUser() async {
    try {
      await _remoteProvider.deleteUser();

      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<bool> existsUser() async {
    // Remote Update(Trigger Gap Handling)
    int maxRetries = 10;
    int retryCount = 0;

    // Retry
    while (retryCount < maxRetries) {
      try {
        await _remoteProvider.existsUser();
        await _remoteProvider.setDeviceToken(
          await FirebaseMessaging.instance.getToken() ?? "",
        );

        break;
      } catch (e) {
        retryCount++;

        if (retryCount == maxRetries) {
          return false;
        }

        await Future.delayed(const Duration(seconds: 1));
      }
    }

    return true;
  }

  @override
  Future<Map<String, dynamic>> readUser() async {
    String id = await _remoteProvider.getId();
    String nickname = await _remoteProvider.getNickname();
    bool isAllowedNotification = await _remoteProvider.getAllowedNotification();

    return {
      'id': id,
      'nickname': nickname,
      'is_allowed_notification': isAllowedNotification,
    };
  }
}
