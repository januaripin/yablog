import 'package:flutter/material.dart';

class NavigatorUtil {
  NavigatorUtil._createInstance();

  static final NavigatorUtil _instance = NavigatorUtil._createInstance();

  factory NavigatorUtil() => _instance;

  final navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState? get currentState => navigatorKey.currentState;
  BuildContext? get context => navigatorKey.currentContext;

  Future<dynamic>? goTo(String routeName) {
    return currentState?.pushNamed(routeName);
  }

  Future<dynamic>? replaceWith(String routeName) {
    return currentState?.pushReplacementNamed(routeName);
  }

  Future<dynamic>? goToHome() {
    return replaceWith('/');
  }
}
