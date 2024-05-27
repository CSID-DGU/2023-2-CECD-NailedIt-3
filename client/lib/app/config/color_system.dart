import 'package:flutter/material.dart';

/// 해당 컬러 시스템은 Figma와 방향이 반대입니다.
abstract class ColorSystem {
  /// Transparent Color
  static const Color transparent = Colors.transparent;

  /// White Color
  static const Color white = Color(0xFFFFFFFF);

  /// Black Color
  static const Color black = Color(0xFF151515);

  /// Primary Color
  static const MaterialColor primary = MaterialColor(
    _primaryValue,
    <int, Color>{
      900: Color(0xFF151F56),
      800: Color(0xFF132E8F),
      700: Color(0xFF2651C1),
      600: Color(0xFF366BE1),
      500: Color(0xFF5588FD),
      400: Color(0xFF7DA3FA),
      300: Color(0xFFA6BEFF),
      200: Color(0xFFC1D2FF),
      100: Color(0xFFD5E1FF),
      50: Color(0xFFEBF1FF),
    },
  );
  static const int _primaryValue = 0xFF5588FD;

  /// Secondary Color
  static const MaterialColor secondary = MaterialColor(
    _secondaryValue,
    <int, Color>{
      900: Color(0xFF333957),
      800: Color(0xFF434F79),
      700: Color(0xFF5A6691),
      600: Color(0xFF6E7AA3),
      500: Color(0xFF8490BC),
      400: Color(0xFF9EAAD3),
      300: Color(0xFFB5BFE0),
      200: Color(0xFFCFD7F1),
      100: Color(0xFFE3E7F6),
      50: Color(0xFFEFF2FB),
    },
  );
  static const int _secondaryValue = 0xFF8490BC;

  /// Error Color
  static const MaterialColor error = MaterialColor(
    _errorValue,
    <int, Color>{
      900: Color(0xFF531A1A),
      800: Color(0xFF732828),
      700: Color(0xFF992C2C),
      600: Color(0xFFC53A3A),
      500: Color(0xFFE24A4A),
      400: Color(0xFFF76868),
      300: Color(0xFFFF9595),
      200: Color(0xFFFFB7B7),
      100: Color(0xFFFFD5D5),
      50: Color(0xFFFFE8E8),
    },
  );
  static const int _errorValue = 0xFFE24A4A;

  /// Neutral Color
  static MaterialColor neutral = const MaterialColor(
    _neutralValue,
    <int, Color>{
      900: Color(0xFF313139),
      800: Color(0xFF464655),
      700: Color(0xFF5F5F6F),
      600: Color(0xFF7D7D8E),
      500: Color(0xFF9292A5),
      400: Color(0xFFB1B1C3),
      300: Color(0xFFCBCBD8),
      200: Color(0xFFDBDBE6),
      100: Color(0xFFE9E9F1),
      50: Color(0xFFF2F2F7),
    },
  );
  static const int _neutralValue = 0xFF9292A5;
}
