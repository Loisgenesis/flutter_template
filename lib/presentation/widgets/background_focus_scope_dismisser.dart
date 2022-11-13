import 'package:flutter/material.dart';

/// A widget for dismissing the keyboard on tap outside.
///
/// Using this widget will allow you to avoid using this all the time:
///
/// ```dart
/// GestureDetector(
///   onTap: () {
///      final focusScope = FocusScope.of(context);
///      if (focusScope.hasFocus) {
///        focusScope.unfocus();
///       }
///   },
///   child: MyWidget(),
/// ),
/// ```
class BackgroundFocusScopeDismisser extends StatelessWidget {
  const BackgroundFocusScopeDismisser({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final focusScope = FocusScope.of(context);

        if (focusScope.hasFocus) {
          focusScope.unfocus();
        }
      },
      child: child,
    );
  }
}
