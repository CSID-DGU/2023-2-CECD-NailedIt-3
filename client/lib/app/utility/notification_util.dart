import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:nailed_it/app/utility/log_util.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/timezone.dart';

abstract class NotificationUtil {
  static final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  static bool isFlutterLocalNotificationsInitialized = false;

  static const AndroidNotificationDetails
      _androidPlatformLocalChannelSpecifics = AndroidNotificationDetails(
    'nailed_it_channel_id',
    'N & I',
    channelDescription: 'N & I Channel',
    importance: Importance.max,
    priority: Priority.high,
    showWhen: false,
  );

  static const AndroidNotificationDetails
      _androidPlatformRemoteChannelSpecifics = AndroidNotificationDetails(
    'nailed_it_channel_id',
    'N & I',
    channelDescription: 'N & I Channel',
    importance: Importance.high,
    priority: Priority.high,
    showWhen: false,
  );

  static const NotificationDetails _platformLocalChannelSpecifics =
      NotificationDetails(
    android: _androidPlatformLocalChannelSpecifics,
    iOS: DarwinNotificationDetails(
      badgeNumber: 1,
    ),
  );

  static const NotificationDetails _platformRemoteChannelSpecifics =
      NotificationDetails(
    android: _androidPlatformRemoteChannelSpecifics,
    iOS: DarwinNotificationDetails(
      badgeNumber: 1,
    ),
  );

  static Future<void> initialize() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('mipmap/ic_launcher');

    DarwinInitializationSettings initializationSettingsIOS =
        const DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await _plugin.initialize(initializationSettings);
  }

  static Future<void> setupRemoteNotification() async {
    if (isFlutterLocalNotificationsInitialized) return;

    AndroidNotificationChannel channel = const AndroidNotificationChannel(
      'nailed_it_channel_id',
      'N & I',
      description: 'nailed_it_remote_channel_description', // description
      importance: Importance.high,
    );

    await _plugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    // iOS foreground notification 권한
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    // IOS background 권한 체킹 , 요청
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    // 셋팅flag 설정
    isFlutterLocalNotificationsInitialized = true;
  }

  static Future<void> setScheduleLocalNotification({
    required bool isActive,
    required int hour,
    required int minute,
  }) async {
    if (isActive) {
      await _plugin.cancel(0);
      await _plugin.zonedSchedule(
        0,
        'N & I',
        Get.deviceLocale?.languageCode == 'ko'
            ? '알림을 확인 해주세요.'
            : 'Please check the notification.',
        _toDateTime(hour, minute),
        _platformLocalChannelSpecifics,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
      );
    } else {
      await _plugin.cancel(0);
    }
  }

  @pragma('vm:entry-point')
  static Future<void> onBackgroundHandler(
    RemoteMessage message,
  ) async {
    LogUtil.debug('onBackgroundHandler');

    RemoteNotification? notification = message.notification;
  }

  static void onForegroundHandler(
    RemoteMessage message,
  ) async {
    LogUtil.debug('onForegroundHandler');

    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    if (notification != null && android != null) {
      _plugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        _platformRemoteChannelSpecifics,
      );
    }
  }

  static TZDateTime _toDateTime(hour, minute) {
    // Current Time
    DateTime localNow = DateTime.now();
    DateTime localWhen =
        DateTime(localNow.year, localNow.month, localNow.day, hour, minute);

    // UTC Time
    TZDateTime now = TZDateTime.from(localNow, tz.local);
    TZDateTime when = TZDateTime.from(localWhen, tz.local);

    if (when.isBefore(now)) {
      return when.add(const Duration(days: 1));
    } else {
      return when;
    }
  }
}
