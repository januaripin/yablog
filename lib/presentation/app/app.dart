import 'package:flutter/material.dart';

import '../../router/app_back_dispatcher.dart';
import '../../router/app_route_information_parser.dart';
import '../../router/app_router_delegate.dart';
import '../../router/app_router_state.dart';
import 'app_themes.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final AppRouterDelegate _routerDelegate = AppRouterDelegate(AppRouterState());
  final AppRouteInformationParser _routeInformationParser =
      AppRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'yakoding',
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
      backButtonDispatcher: AppBackDispatcher(_routerDelegate),
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
    );
  }
}
