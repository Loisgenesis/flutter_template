import 'package:flutter/material.dart';
import 'package:owwn_coding_challenge/presentation/resources/resources.dart';

ThemeData getAppTheme(Brightness brightness) {
  final colors = brightness == Brightness.light ? colorsDark : colorsDark;

  return ThemeData(
    brightness: brightness,
    fontFamily: AppFonts.raleWay,
    scaffoldBackgroundColor: colors.background,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: colors.background,
      elevation: 0,
      titleTextStyle: const TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.w500,
        fontFamily: AppFonts.raleWay,
      ),
    ),
  );
}
