import 'dart:async';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class NavigationManager {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> push(Route<dynamic> route) {
    return navigatorKey.currentState?.push(route) ?? Future.value(false);
  }

  Future<dynamic> pushAndRemoveUntil(
    Route<dynamic> newRoute,
    bool Function(Route<dynamic>) predicate,
  ) {
    return navigatorKey.currentState?.pushAndRemoveUntil(newRoute, predicate) ??
        Future.value(false);
  }

  void popUntil(
    bool Function(Route<dynamic>) predicate,
  ) {
    navigatorKey.currentState?.popUntil(predicate);
  }

  Future<dynamic> pushReplacement(Route<dynamic> newRoute) {
    return navigatorKey.currentState?.pushReplacement(newRoute) ??
        Future.value(false);
  }

  void popUntilFirst() {
    return navigatorKey.currentState?.popUntil((route) => route.isFirst);
  }

  Future<T?>? popAndPushUntilFirst<T>(Route<T> newRoute) {
    return navigatorKey.currentState?.pushAndRemoveUntil(
      newRoute,
      (route) => route.isFirst,
    );
  }

  void pop([dynamic value]) {
    return navigatorKey.currentState?.pop(value);
  }

  Future<bool>? maybePop<T>([T? value]) {
    return navigatorKey.currentState?.maybePop(value);
  }

}
