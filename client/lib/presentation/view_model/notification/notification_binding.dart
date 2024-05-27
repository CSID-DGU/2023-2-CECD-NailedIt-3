import 'package:get/get.dart';

import 'notification_view_model.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationViewModel>(() => NotificationViewModel());
  }
}
