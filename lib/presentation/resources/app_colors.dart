import 'package:flutter/material.dart';

class AppColors {
  final Color background;
  final Color backgroundMedium;
  final Color backgroundLight;
  final Color labelPrimary;
  final Color labelSecondary;
  final Color onTintPrimary;
  final Color onTintSecondary;
  final Color tintBlack;
  final Color tintGreen1;
  final Color tintGreen2;
  final Color tintGreen3;
  final Color blue;
  final Color orange;
  final Color yellow;
  final Color error;
  final Color yellow15;
  final Color yellow30;
  final Color green30;
  final Color green15;
  final Color orange30;
  final Color orange15;
  final Color blue30;
  final Color blue15;
  final Color red15;
  final Color tintRed15;
  final Color grey;
  final Color white70;
  final Color white50;
  final Color white30;
  final Color white20;
  final Color white10;
  final Color white;
  final Color gradientBlack70;
  final Color blueMedium;
  final Color gray;

  const AppColors({
    required this.background,
    required this.backgroundMedium,
    required this.backgroundLight,
    required this.labelPrimary,
    required this.labelSecondary,
    required this.onTintPrimary,
    required this.onTintSecondary,
    required this.tintBlack,
    required this.tintGreen1,
    required this.tintGreen2,
    required this.tintGreen3,
    required this.blue,
    required this.orange,
    required this.yellow,
    required this.error,
    required this.yellow15,
    required this.yellow30,
    required this.green30,
    required this.green15,
    required this.orange30,
    required this.orange15,
    required this.blue30,
    required this.blue15,
    required this.red15,
    required this.tintRed15,
    required this.grey,
    required this.white70,
    required this.white50,
    required this.white30,
    required this.white20,
    required this.white10,
    required this.white,
    required this.gradientBlack70,
    required this.blueMedium,
    required this.gray,
  });
}

const colorsDark = AppColors(
  background: Color(0xFF0B0B0B),
  backgroundMedium: Color(0xFF141414),
  backgroundLight: Color(0xFF1F1F1F),
  labelPrimary: Color(0xFFFFFFFF),
  labelSecondary: Color(0xFFCCCCCC),
  onTintPrimary: Color(0xFFFFFFFF),
  onTintSecondary: Color(0xFF757575),
  tintBlack: Color(0xFF000000),
  tintGreen1: Color(0xFF168E4F),
  tintGreen2: Color(0xFF17B364),
  tintGreen3: Color(0xFF1ACD73),
  blue: Color(0xFF21ACE8),
  orange: Color(0xFFF78E26),
  yellow: Color(0xFFF9CF1C),
  error: Color(0xFFFF3838),
  yellow15: Color(0x4DF9CF1C),
  yellow30: Color(0x26F9CF1C),
  green30: Color(0x4D17B364),
  green15: Color(0x2617B364),
  orange30: Color(0x4DE99341),
  orange15: Color(0x26E99341),
  blue30: Color(0x4D21ACE8),
  blue15: Color(0x2621ACE8),
  red15: Color(0xFFFF3838),
  tintRed15: Color(0x26FF3838),
  grey: Color(0xffC4C4C4),
  white70: Color(0xB2FFFFFF),
  white50: Color(0x80FFFFFF),
  white30: Color(0x4DFFFFFF),
  white20: Color(0x33FFFFFF),
  white10: Color(0x1AFFFFFF),
  white: Color(0xFFFFFFFF),
  gradientBlack70: Color(0xB30D0D0D),
  blueMedium: Color(0xFF007AFF),
  gray: Color(0xFFF8F8F8),
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
