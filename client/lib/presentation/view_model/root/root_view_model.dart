import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:nailed_it/app/utility/notification_util.dart';

class RootViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final RxInt _selectedIndex;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  int get selectedIndex => _selectedIndex.value;

  @override
  void onInit() {
    super.onInit();

    FirebaseMessaging.onMessage
        .listen(NotificationUtil.showFlutterNotification);
    FirebaseMessaging.onBackgroundMessage(NotificationUtil.onBackgroundHandler);

    _selectedIndex = 0.obs;
  }

  void fetchIndex(int index) {
    _selectedIndex.value = index;
  }
}
