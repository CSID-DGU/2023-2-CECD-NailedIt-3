import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:nailed_it/data/factory/local_storage_factory.dart';
import 'package:nailed_it/data/factory/remote_storage_factory.dart';
import 'package:nailed_it/data/provider/user/user_local_provider.dart';
import 'package:nailed_it/data/provider/user/user_remote_provider.dart';
import 'package:nailed_it/domain/repository/user_repository.dart';

class UserRepositoryImpl extends GetxService implements UserRepository {
  late final UserLocalProvider _localProvider;
  late final UserRemoteProvider _remoteProvider;

  @override
  void onInit() {
    super.onInit();

    _localProvider = LocalStorageFactory.userLocalProvider;
    _remoteProvider = RemoteStorageFactory.userRemoteProvider;
  }

  @override
  Future<bool> existsUser() async {
    // Remote Update(Trigger Gap Handling)
    int maxRetries = 5;
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
}
