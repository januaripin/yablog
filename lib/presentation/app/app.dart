import 'package:flutter/material.dart';

import 'app_route_information_parser.dart';
import 'app_router_delegate.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final AppRouterDelegate _routerDelegate = AppRouterDelegate();
  final AppRouteInformationParser _routeInformationParser =
      AppRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'yakoding',
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
    );
  }
}
