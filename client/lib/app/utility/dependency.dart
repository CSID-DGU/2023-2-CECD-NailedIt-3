import 'package:get/get.dart';
import 'package:nailed_it/data/repository/notification_history/notification_history_repository_impl.dart';
import 'package:nailed_it/data/repository/user/user_repository_impl.dart';
import 'package:nailed_it/domain/repository/notification_history/notification_history_repository.dart';
import 'package:nailed_it/domain/repository/user/user_repository.dart';

class Dependency extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserRepository>(
      () => UserRepositoryImpl(),
    );
    Get.lazyPut<NotificationHistoryRepository>(
      () => NotificationHistoryRepositoryImpl(),
    );
  }
}
