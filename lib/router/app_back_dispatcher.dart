import 'package:flutter/material.dart';

import 'app_router_delegate.dart';

class AppBackDispatcher extends RootBackButtonDispatcher {
  final AppRouterDelegate _appRouterDelegate;

  AppBackDispatcher(AppRouterDelegate appRouterDelegate)
      : _appRouterDelegate = appRouterDelegate;

  @override
  Future<bool> didPopRoute() {
    return _appRouterDelegate.popRoute();
  }
}
