import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:nailed_it/app/config/firebase_options.dart';
import 'package:nailed_it/app/utility/notification_util.dart';
import 'package:nailed_it/data/factory/local_storage_factory.dart';
import 'package:nailed_it/data/factory/remote_storage_factory.dart';
import 'package:nailed_it/data/provider/user/user_local_provider.dart';
import 'package:nailed_it/data/provider/user/user_remote_provider.dart';
import 'package:nailed_it/main_app.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  // System Init
  await onSystemInit();

  // System Ready
  await onSystemReady();

  // Date Binding
  await initializeDateFormatting();

  // Run App
  runApp(const MainApp());
}

Future<void> onSystemInit() async {
  // WidgetsBinding
  WidgetsFlutterBinding.ensureInitialized();

  // Environment
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // DateTime Formatting
  await initializeDateFormatting();
  tz.initializeTimeZones();

  // Permission
  await NotificationUtil.initialize();
  await NotificationUtil.setupRemoteNotification();

  // Widget
  await FlutterAppBadger.removeBadge();

  // Database
  // LocalDatabaseFactory.onInit();
  await LocalStorageFactory.onInit();
  await RemoteStorageFactory.onInit();
}

Future<void> onSystemReady() async {
  UserLocalProvider localProvider = LocalStorageFactory.userLocalProvider;
  UserRemoteProvider remoteProvider = RemoteStorageFactory.userRemoteProvider;

  bool isFirstRun = localProvider.getFirstRun();

  if (isFirstRun && FirebaseAuth.instance.currentUser != null) {
    await remoteProvider.setDeviceToken("");
    await FirebaseAuth.instance.signOut();
    await localProvider.setFirstRun(false);
  }
}
