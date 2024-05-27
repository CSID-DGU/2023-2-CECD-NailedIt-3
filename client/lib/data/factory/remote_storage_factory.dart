import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nailed_it/data/provider/notification/notification_remote_provider.dart';
import 'package:nailed_it/data/provider/notification/notification_remote_provider_impl.dart';
import 'package:nailed_it/data/provider/user/user_remote_provider.dart';
import 'package:nailed_it/data/provider/user/user_remote_provider_impl.dart';

abstract class RemoteStorageFactory {
  static FirebaseFirestore? _instance;

  static late final UserRemoteProvider _userRemoteProvider;
  static late final NotificationRemoteProvider notificationRemoteProvider;

  static UserRemoteProvider get userRemoteProvider => _userRemoteProvider;

  static Future<void> onInit() async {
    _instance = FirebaseFirestore.instance;

    _userRemoteProvider = UserRemoteProviderImpl(storage: _instance!);
    notificationRemoteProvider =
        NotificationRemoteProviderImpl(storage: _instance!);
  }
}
