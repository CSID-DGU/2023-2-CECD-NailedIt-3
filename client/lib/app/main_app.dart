import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:nailed_it/binding/init_binding.dart';
import 'package:nailed_it/config/app_pages.dart';
import 'package:nailed_it/config/app_routes.dart';
import 'package:nailed_it/config/color_system.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    FlutterNativeSplash.remove();
    return GetMaterialApp(
      // App Title
      title: "ReBook",

      locale: Get.deviceLocale,
      fallbackLocale: const Locale('ko', 'KR'),

      // Theme
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Pretendard',
        colorSchemeSeed: ColorSystem.blue, //
        scaffoldBackgroundColor: const Color(0xFFf6f6f8),
      ),

      initialRoute: Routes.ROOT,
      initialBinding: InitBinding(),
      getPages: appPages,
    );
  }
}