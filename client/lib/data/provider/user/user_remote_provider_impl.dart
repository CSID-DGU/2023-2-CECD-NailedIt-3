import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nailed_it/data/provider/user/user_remote_provider.dart';

class UserRemoteProviderImpl implements UserRemoteProvider {
  UserRemoteProviderImpl({
    required FirebaseFirestore storage,
  }) : _storage = storage;

  final FirebaseFirestore _storage;

  @override
  Future<bool> existsUser() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    return await _storage
        .collection('users')
        .doc(uid)
        .get()
        .then((value) => value.exists);
  }

  @override
  Future<String> getId() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    return await _storage
        .collection('users')
        .doc(uid)
        .get()
        .then((value) => value.data()![URPExtension.id]);
  }

  @override
  Future<String> getNickname() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    return await _storage
        .collection('users')
        .doc(uid)
        .get()
        .then((value) => value.data()![URPExtension.nickname]);
  }

  @override
  Future<bool> getAllowedNotification() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    return await _storage
        .collection('users')
        .doc(uid)
        .get()
        .then((value) => value.data()![URPExtension.allowedNotification]);
  }

  @override
  Future<void> setAllowedNotification(bool allowedNotification) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    await _storage.collection('users').doc(uid).update({
      URPExtension.allowedNotification: allowedNotification,
    });
  }

  @override
  Future<void> setDeviceToken(String token) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    await _storage.collection('users').doc(uid).update({
      URPExtension.deviceToken: token,
    });
  }
}

extension URPExtension on UserRemoteProvider {
  static const String id = 'id';
  static const String nickname = 'nickname';
  static const String allowedNotification = 'is_allowed_notification';
  static const String deviceToken = 'device_token';
}
