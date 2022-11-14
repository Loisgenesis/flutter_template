import 'package:flutter/material.dart';

class AppColors {
  final Color background;
  final Color tintGreen2;
  final Color tintBlack;
  final Color red;
  final Color white10;
  final Color white;

  const AppColors({
    required this.background,
    required this.tintBlack,
    required this.tintGreen2,
    required this.red,
    required this.white10,
    required this.white,
  });
}

const colorsDark = AppColors(
  background: Color(0xFF0B0B0B),
  tintBlack: Color(0xFF000000),
  tintGreen2: Color(0xFF17B364),
  red: Color(0xFFFF3838),
  white10: Color(0x1AFFFFFF),
  white: Color(0xFFFFFFFF),
);

extension AppColorsExtension on BuildContext {
  AppColors get colors {
    final brightness = Theme.of(this).brightness;
    switch (brightness) {
      case Brightness.light:
        return colorsDark;
      case Brightness.dark:
        return colorsDark;
      default:
        return colorsDark;
    }
  }
}
