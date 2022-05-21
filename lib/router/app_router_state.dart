import 'package:flutter/material.dart';

import 'app_route_configuration.dart';

class AppRouterState extends ChangeNotifier {
  AppRouterState._createInstance() : config = AppRouteConfiguration.home();

  static final AppRouterState _instance = AppRouterState._createInstance();

  factory AppRouterState() => _instance;

  AppRouteConfiguration config;

  String? get slug => config.slug;
  bool get isNotFound => config.isNotFound;
  bool get isHomePage => config.slug == null;
  bool get isPost => config.slug != null;

  void goToHome() {
    config = AppRouteConfiguration.home();
    notifyListeners();
  }

  void goToPostPage(String? id) {
    config = AppRouteConfiguration.post(id);
    notifyListeners();
  }

  void goToNotFoundPage() {
    config = AppRouteConfiguration.notFound();
    notifyListeners();
  }
}
