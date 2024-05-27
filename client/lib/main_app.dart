import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:nailed_it/app/config/app_config.dart';
import 'package:nailed_it/app/config/app_pages.dart';
import 'package:nailed_it/app/config/app_routes.dart';
import 'package:nailed_it/app/config/color_system.dart';
import 'package:nailed_it/app/utility/dependency.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    FlutterNativeSplash.remove();

    return GetMaterialApp(
      // App Title
      title: AppConfig.APP_TITLE,

      locale: Get.deviceLocale,
      fallbackLocale: const Locale('ko', 'KR'),

      // Theme
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Pretendard',
        colorSchemeSeed: ColorSystem.primary,
        scaffoldBackgroundColor: const Color(0xFFf6f6f8),
      ),

      initialRoute: AppRoutes.ROOT,
      initialBinding: Dependency(),
      getPages: AppPages.data,
    );
  }
}
