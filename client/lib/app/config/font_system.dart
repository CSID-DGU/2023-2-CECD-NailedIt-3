// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:nailed_it/app/config/app_config.dart';
import 'package:nailed_it/app/config/color_system.dart';

abstract class FontSystem {
  static const TextStyle H1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    fontFamily: AppConfig.APP_FONT_STYLE,
    color: ColorSystem.black,
    height: 1.5,
  );

  static const TextStyle H2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    fontFamily: AppConfig.APP_FONT_STYLE,
    color: ColorSystem.black,
    height: 1.5,
  );

  static const TextStyle H3 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    fontFamily: AppConfig.APP_FONT_STYLE,
    color: ColorSystem.black,
    height: 1.444,
  );

  static const TextStyle H4 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontFamily: AppConfig.APP_FONT_STYLE,
    color: ColorSystem.black,
    height: 1.75,
  );

  static const TextStyle H5 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: AppConfig.APP_FONT_STYLE,
    color: ColorSystem.black,
    height: 1.75,
  );

  static const TextStyle Sub1 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    fontFamily: AppConfig.APP_FONT_STYLE,
    color: ColorSystem.black,
    height: 1.714,
  );

  static const TextStyle Sub2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: AppConfig.APP_FONT_STYLE,
    color: ColorSystem.black,
    height: 1.714,
  );

  static const TextStyle Sub3 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: AppConfig.APP_FONT_STYLE,
    color: ColorSystem.black,
    height: 1.667,
  );
}
