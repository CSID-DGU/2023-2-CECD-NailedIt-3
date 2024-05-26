abstract class UserRepository {
  Future<void> updateAllowedNotification(bool isAllowedNotification);

  Future<bool> updateDeviceToken(String deviceToken);

  Future<bool> deleteUser();

  Future<bool> existsUser();

  Future<Map<String, dynamic>> readUser();
}
